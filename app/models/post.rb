class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title,
  :body,
  presence: { message: "No puede estar vacio"}
  validates :body, length: { minimum: 250 , message: 'El minimo de caracteres es 250'}
end
