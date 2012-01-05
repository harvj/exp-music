class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me

  validates_presence_of :first_name, :last_name, :username
  validates_uniqueness_of :username
  validates_uniqueness_of :email, :case_sensitive => false

end