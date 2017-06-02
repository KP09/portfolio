class Project < ApplicationRecord

  belongs_to :user
  has_many :participations, dependent: :nullify
  has_many :contributions, through: :participations

  validates :title, presence: true
  validates :brief, presence: true
  validates :category, presence: true
  validates :user_id, presence: true

end

