class Contribution < ApplicationRecord
  mount_uploader :file, ContributionUploader
  belongs_to :participation
  has_one :project, through: :participation
end
