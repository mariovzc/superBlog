class Post < ApplicationRecord
  belongs_to :user
  validates :title,
  :body,
  presence: { message: "can't be blank"}

end
