class MessagesController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    #if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
     # @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
      #redirect_to "/rooms/#{@message.room_id}"
    #else
     # redirect_back(fallback_location: root_path)
    #end
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
     # @message = Message.new(message_params)
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
      @room = @message.room
      if @message.save
          @room.create_notification_comment(current_user, @message.id)  #<-メソッドとして呼び出す
          redirect_to(room_path(@message.room_id))
      else
          flash[:alert] = "メッセージ送信に失敗しました。"
          redirect_to(room_path(@message.room_id))
      end
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
      redirect_to(room_path(@message.room_id))
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id, :user_id)
  end

end
