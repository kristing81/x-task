 require 'faker'

# Create mutants 
20.times do
   Mutant.create!(
     name:  Faker::Name.name
   )
 end
 mutants = Mutant.all
 
 # Create Teams
 5.times do
   Team.create!(
     name:  Faker::Company.name
   )
 end
 teams= Team.all

 # Create Tasks
 10.times do
   Task.create!(
    description: Faker::Company.bs
   )
 end

 tasks = Task.all

 puts "Seed finished"

