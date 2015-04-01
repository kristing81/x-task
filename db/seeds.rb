require 'faker'

# Create Teams with Tasks and Mutants
5.times do
 team = Team.create!(
   name:  Faker::Company.name
 )
10.times do
 Task.create!(
  description: Faker::Company.bs,
  team: team
 )
end
10.times do
 Mutant.create!(
   name:  Faker::Name.name,
   team: team
 )
end
end
teams= Team.all
tasks = Task.all
mutants = Mutant.all

 puts "Seed finished"

