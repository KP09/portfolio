# Destroy all instances of all models to clear database (ORDER IMPORTANT!)
Contribution.destroy_all
Participation.destroy_all
Project.destroy_all
User.destroy_all

# Method that creates 1 User instance
def seed_user
  email = Faker::Internet.email
  password = "123456"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  bio = Faker::Job.title
  User.create!(email: email, password: password, first_name: first_name, last_name: last_name, bio: bio)
end

# Method that creates 1 Project instance, given a User instance
def seed_project(user)
  title = "Create a #{Faker::Job.field} system"
  brief = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, quas. Ut quia veritatis ullam minus facilis dolores deserunt quas id in sit nostrum facere soluta cumque, animi iure porro dicta!"
  category = Faker::Job.field
  end_date = DateTime.now + (7..31).to_a.sample
  max_joins = (50..100).to_a.sample
  Project.create!(title: title, brief: brief, category: category, end_date: end_date, max_joins: max_joins, user: user)
end

# Method that creates 1 Participation instance, given a User instance and a Project instance
def seed_participation(user, project)
  # Unless statement to stop users participating on their own projects
  unless user.projects.include?(project)
    Participation.create!(user: user, project: project)
  end
end

# Method that creates 1 Contribution instance, given a Participation instance
def seed_contribution(participation)
  comment = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur animi repudiandae odio, sit consequuntur non consectetur sint! Expedita enim illum error animi, recusandae delectus facilis voluptas provident voluptatem, debitis dolore?"
  starred = [true, false].sample
  Contribution.create(comment: comment, starred: starred, participation: participation)
end

# Loop to create Users
10.times do
  user = seed_user
  # Nested loop to create Project(s) for every User
  2.times do
    project = seed_project(user)
  end
end

# Loop to create Participations for random User/Project combinations
20.times do
  user = User.all.sample
  project = Project.all.sample
  seed_participation(user, project)
end

# Iteration and nested loop to create Contributions for each Participation
Participation.all.each do |participation|
  2.times do
    seed_contribution(participation)
  end
end
