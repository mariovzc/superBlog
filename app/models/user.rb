class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :posts
  has_many :comments
  
  #Validations
  validates :password,
            length: { minimum: 6 , message: 'is too short (minimum is 6 characters)'},
            confirmation: {message: 'You must confirm your password'}
  
  validates :username,
            uniqueness: {message: "has already been taken"} ,
            length: { minimum: 6, message: 'is too short (minimum is 6 characters)' },case_sensitive: false
  
  validates :email,
            uniqueness: {message: "has already been taken"},
            presence: { message: "can't be blank"},case_sensitive: false

  validates :username,
            :last_name,
            :first_name ,
            presence: { message: "can't be blank"}
  
end
