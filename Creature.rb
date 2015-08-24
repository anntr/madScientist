require  File.expand_path('../Scientist.rb', __FILE__)

class Creature
  attr_accessor :fitness
  def initialize chromosome_set
    scientist = Dietician.new
    @chromosome_set = chromosome_set
    @fitness = scientist.rate_creature_fitness chromosome_set
  end
end