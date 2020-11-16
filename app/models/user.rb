# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  
  has_one :user_profile, class_name: "UserProfile"
end
