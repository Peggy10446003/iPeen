class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :projects
  
  has_one :profile
  accepts_nested_attributes_for :profile
  
  delegate :nickname, :language, :first_name, :last_name, to: :profile
  
  def admin?
    role == "admin"
  end
  
  def pm?
    role == "pm"
  end
  
  def display_name
    if profile.present?
      if nickname.present?
        return nickname
      else 
        return first_name + " " + last_name
      end
    else
      return email.split("@").first
    end
  end
end
