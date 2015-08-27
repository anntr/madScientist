require  File.expand_path('../Creature.rb', __FILE__)
require  File.expand_path('../Scientist.rb', __FILE__)
require  File.expand_path('../Generation.rb', __FILE__)
class Laboratory

  attr_accessor :population, :scientist

  def initialize(scientist, chromosomes_sets, population_size = 1000)
    @chromosomes_sets = chromosomes_sets
    @scientist = scientist
    @population = create_first_population population_size
  end


  def produce_result generations = 500
    result = nil
    (1..generations).each do
      generation = Generation.new(@population)
      @population = generation.generate_new_population
      evaluate_population
      result = generation.sort_population @population
    end
    result

  end

  private

  def evaluate_population
    @population.each do |creature|
      @scientist.rate_creature_fitness(creature)
    end
  end

  def random_genotype
    genotype = []
    @chromosomes_sets.each do |chromosome_set|
      genotype << chromosome_set.sample
    end
    genotype
  end

  def create_first_population population_size
    (1..population_size).map{
      creature = Creature.new(random_genotype)
      @scientist.rate_creature_fitness(creature)
      creature
    }
  end

end