class Project < ApplicationRecord

  belongs_to :user
  has_many :participations

  validates :title, presence: true
  validates :brief, presence: true
  validates :category, presence: true

end

