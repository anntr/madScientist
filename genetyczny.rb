load 'Scientist.rb'
load 'Creature.rb'
load 'Genotype.rb'
load 'Laboratory.rb'
load 'Dietician.rb'
load 'Meal.rb'

data = Meal.generate_database_for_alg
scientist = Dietician.new

lab = Laboratory.new scientist, data

res = lab.produce_result