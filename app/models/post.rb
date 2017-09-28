class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title,
  :body,
  presence: { message: "can't be blank"}
  validates :body, length: { minimum: 6 , message: 'is too short (minimum is 6 characters)'}
end
