load 'Scientist.rb'
load 'Creature.rb'
load 'Genotype.rb'
load 'Laboratory.rb'
load 'Dietician.rb'
load 'Meal.rb'

data = Meal.generate_database_for_alg
lab = Laboratory.new data