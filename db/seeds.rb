# Destroy all instances of all models to clear database (ORDER IMPORTANT!)
Contribution.destroy_all
Participation.destroy_all
Project.destroy_all
User.destroy_all

# # Create developer users
kees = User.create!(email: "kk.postma@gmail.com", password: "123456", first_name: "Kees", last_name: "Postma", bio: "Le Wagon Student")
rami = User.create!(email: "rbakri1@gmail.com", password: "123456", first_name: "Rami", last_name: "Bakri", bio: "Le Wagon Student")
james = User.create!(email: "james@hewines.com", password: "123456", first_name: "James", last_name: "Block", bio: "Le Wagon Student")

def seed_project(user)
  title = "Create a #{Faker::Job.field} system"
  brief = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, quas. Ut quia veritatis ullam minus facilis dolores deserunt quas id in sit nostrum facere soluta cumque, animi iure porro dicta!"
  category = Faker::Job.field
  end_date = DateTime.now + (7..31).to_a.sample
  max_joins = (50..100).to_a.sample
  Project.create!(title: title, brief: brief, category: category, end_date: end_date, max_joins: max_joins, user: user)
end

def seed_participation(user, project)
  # Unless statement to stop users participating on their own projects
  unless user.projects.include?(project)
    Participation.create!(user: user, project: project)
  end
end

def seed_contribution(participation)
  comment = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur animi repudiandae odio, sit consequuntur non consectetur sint! Expedita enim illum error animi, recusandae delectus facilis voluptas provident voluptatem, debitis dolore?"
  starred = [true, false].sample
  Contribution.create!(comment: comment, starred: starred, participation: participation)
end

30.times do
  seed_project(rami)
end

Project.all.each do |project|
  seed_participation(kees, project)
  seed_participation(james, project)
end

Participation.all.each do |participation|
  seed_contribution(participation)
end
