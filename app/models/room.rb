class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  def create_notification_comment(current_user, message_id)
        receiver = Entry.where(room_id: id).where.not(user_id: current_user.id).find_by(room_id: id)
        save_notification_comment(current_user, message_id, receiver.user_id)
  end

    def save_notification_comment(current_user, message_id, visited_id)
        notification = current_user.active_notifications.new(
            visited_id: visited_id,
            room_id: id,
            message_id: message_id
        )
        notification.save if notification.valid?
    end
    
end
