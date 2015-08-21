class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    on: :sign_up }

  validates :phone_number,
    presence: { message: "please provide valid phone number" },
    numericality: { only_integer: true },
    length: { minimum: 10, maximum: 15 }

  validates :password,
    presence: true

  validates :password_confirmation,
    presence: true
end
