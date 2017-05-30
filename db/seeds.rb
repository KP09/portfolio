Project.destroy_all
User.destroy_all
Participation.destroy_all
Contribution.destroy_all

def seed_user
  email = Faker::Internet.email
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  bio = Faker::Job.title
  User.create!(email: email ,first_name: first_name, last_name: last_name, bio: bio)
end

def seed_project(user)
  title = "Create a #{Faker::Job.field} system"
  brief = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, quas. Ut quia veritatis ullam minus facilis dolores deserunt quas id in sit nostrum facere soluta cumque, animi iure porro dicta!"
  category = Faker::Job.field
  end_date = Date.now + (7..31).to_a.sample
  max_joins = (50..100).to_a.sample
  Project.create!(title: title, brief: brief, category: category, end_date: end_date, max_joins: max_joins, user: user)
end

5.times do
  seed_user
end
