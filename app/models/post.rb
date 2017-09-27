class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title,
  :body,
  presence: { message: "can't be blank"}

end
