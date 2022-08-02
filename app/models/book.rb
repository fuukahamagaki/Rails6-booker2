class Book < ApplicationRecord
  belongs_to :user
  validates :title,presence:true,length:{in:2..20}
  validates :body,presence:true,length:{maximum:200}
end
