class Contribution < ApplicationRecord
  belongs_to :participation
  has_one :project, through: :participation
end
