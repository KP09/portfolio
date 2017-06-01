class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Model associations
  has_many :projects
  has_many :participations
  has_many :contributions, through: :participations

  # User validations
  validates :email, presence: true
  validates :first_name, presence: true, on: [:update]
  validates :last_name, presence: true, on: [:update]

  # Attachinary associations
  has_attachment :profile_picture
  has_attachment :cover_photo

  # Finds specific participation instance if there is one for that user on that project.
  def participation(project)
  	participations.find_by(project: project)
  end

  # Returns true or false depending on whether the user has participated (using the action above)
  def participated_to?(project)
  	!participation(project).nil?
  end

  # Finds specific contribution instance if there is one for that user on that project.
  def contribution(project)
  	contributions.find_by(participation: participation(project))
  end

  # Returns true or false depending on whether the user has contributed to that project (using the action above)
  def contributed_to?(project)
  	!contribution(project).nil?
  end

  def full_name
    full_name = "#{self.first_name} #{self.last_name}"
  end
end
