class Project < ApplicationRecord

  belongs_to :user
  has_many :participations

  validates :title, presence: true
  validates :brief, presence: true
  validates :category, presence: true
<<<<<<< HEAD
  validates :user_id, presence: true
=======

>>>>>>> bedc4227c2dbb431099318fcbc21d44c4aae488b
end

