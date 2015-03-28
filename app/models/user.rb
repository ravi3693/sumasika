require 'bcrypt'

class User < ActiveRecord::Base
 include BCrypt
 has_one :account
 has_many :synthesizes
 validates_uniqueness_of :email
 # validates :email, presence: true
 # validates :password, presence: true
 # validates :password, confirmation: true
 # validates :country, presence: true
 # validates :first_name, presence: true
 # validates :last_name, presence: true
 # validates :address, presence: true
 # validates :dob, presence: true  
 dragonfly_accessor :image


 def password
    @password ||= Password.new(password_hash)
 end

 def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
 end
end
