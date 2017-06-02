class Contribution < ApplicationRecord
  mount_uploader :file, ContributionUploader
  belongs_to :participation

  validates :comment, presence: true
  validates :file, presence: true

  def toggle_star(contribution)
    if contribution.starred == true
      contribution.starred == false
    else
      contribution.starred == true
    end
  end
end
