class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]

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

  def self.find_for_linkedin_oauth(auth)
    user_params = {}
    user_params[:provider] = auth[:provider]
    user_params[:uid] = auth[:uid]
    user_params[:email] = auth[:info][:email]
    user_params[:first_name] = auth[:info][:first_name]
    user_params[:last_name] = auth[:info][:last_name]
    user_params[:linkedin_picture_url] = auth[:info][:image]
    user_params[:token] = auth[:credentials][:token]
    user_params[:token_expiry] = Time.at(auth[:credentials][:expires_at])

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def get_picture
    if profile_picture?
      return profile_picture.path
    elsif linkedin_picture_url
      return linkedin_picture_url
    else
      return 'sample'
    end
  end

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

  # Returns full name of user
  def full_name
    full_name = "#{self.first_name} #{self.last_name}"
  end

  def number_of_active_participations
    participations.reject{ |p| p.project.nil? }.count
  end
end
