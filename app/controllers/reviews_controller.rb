class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
  end

  private
    def review_params
      params.permit(:book_id, :score, :content)
    end
end
