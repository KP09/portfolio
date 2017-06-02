class Contribution < ApplicationRecord
  mount_uploader :file, ContributionUploader
  belongs_to :participation

  validates :comment, presence: true
  validates :file, presence: true
end
