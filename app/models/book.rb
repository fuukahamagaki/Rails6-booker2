class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  validates :title,presence:true,length:{in:2..20}
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end

end
