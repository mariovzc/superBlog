class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :posts
  has_many :comments
  
  #Validations
  validates :password,
            length: { minimum: 6 , message: 'El minimo de caracteres es 6'},
            confirmation: {message: 'Debes confirmar tu contraseña'}
  
  validates :username,
            uniqueness: {message: "Ya esta en uso"} ,
            length: { minimum: 6, message: 'es demasiado corto, el minimo de caracteres es 6' },case_sensitive: false
  
  validates :email,
            uniqueness: {message: "Ya esta en uso"},
            presence: { message: "No puede estar en blanco"},case_sensitive: false

  validates :username,
            :last_name,
            :first_name ,
            presence: { message: "Ya esta en uso"}
  
end
