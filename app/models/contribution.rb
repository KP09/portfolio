class Contribution < ApplicationRecord
  mount_uploader :file, ContributionUploader
  belongs_to :participation
  has_one :project, through: :participation
  has_one :user, through: :participation

  validates :comment, presence: true
  validates :file, presence: true
end
