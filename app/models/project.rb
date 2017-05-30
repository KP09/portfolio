class Project < ApplicationRecord

  belongs_to :user
  has_many :participations
  has_many :contributions, through: :participations

  validates :title, presence: true
  validates :brief, presence: true
  validates :category, presence: true

end

