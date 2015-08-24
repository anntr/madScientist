require  File.expand_path('../Creature.rb', __FILE__)

class Laboratory
  attr_accessor :population
  def initialize(chromosomes_sets, population_size = 1000)
    @chromosomes_sets = chromosomes_sets
    @population = create_population population_size
  end

  def create_population population_size
    (1..population_size).map{Creature.new(random_genotype)}
  end


  def sort_population
    @population.sort_by!{ |creature| creature.fitness}.reverse!
  end

  
  private

  def random_genotype
    genotype = []
    @chromosomes_sets.each do |chromosome_set|
      genotype << chromosome_set.sample
    end
    genotype
  end

end