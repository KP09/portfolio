class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_one :contribution, dependent: :destroy
end

