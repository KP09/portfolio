class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Model associations
  has_many :projects
  has_many :participations
  has_many :contributions, through: :participations

  # User validations
  validates :email, presence: true
  validates :first_name, presence: true, on: [:update]
  validates :last_name, presence: true, on: [:update]

  # Attachinary associations
  has_attachment :profile_picture
  has_attachment :cover_photo
end
