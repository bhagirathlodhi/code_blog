class User < ApplicationRecord
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  # belongs_to :parent, class_name: "Comment", optional: true
  # has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:username]

#  attr_accessor :login

#  def login 
#   @login || self.full_name || self.email
#  end
  
#  def self.find_for_authentication(warden_condition)
#   condition = warden_condition.dup
#   if(login = condition.delete(:login))
#     where(condition.to_h).where(["lower(full_name) = :value OR lower(email) = :value", { value: login.downcase }]).first
#   elsif condition.has_key?(:username) || condition.has_key?(:email)
#     where(condition.to_h).first
#   end
#  end
end
