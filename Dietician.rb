require  File.expand_path('../Scientist.rb', __FILE__)

class Dietician < Scientist
  def initialize total_cal = 1500
    @diet = total_cal
  end

  def rate_chromosome_fitness(chromosome)
    calc_fitness "calories",nil, chromosome
  end

  def rate_creature_fitness(creature)
    fitness = 0
    carbs = 0
    lipids= 0
    proteins = 0
    creature.chromosome_set.each do |meal|
      carbs += meal.carbs
      lipids += meal.lipids
      proteins += meal.proteins
      fitness += rate_chromosome_fitness meal
    end
    creature.fitness = fitness + calc_fitness("carbs", carbs) + calc_fitness("lipids", lipids) + calc_fitness("proteins", proteins)
  end

  def get_reference type, chromosome = nil
    if type == "calories"
      test = chromosome.send(type)
      case test
        when 1,5
          @diet*0.2
        when 2,4
          @diet*0.1
        when 3
          @diet*0.4
        else
          200
      end
    else
      case type
        when "carbs"
          @diet*0.6
        when "lipids"
          @diet*0.25
        when "proteins"
          @diet*0.15
      end
    end
  end

  def calc_fitness type, total_value = nil, chromosome = nil
    p = rand.round(2)
    ref_value = get_reference(type, chromosome)
    total_value ||= chromosome.send(type)
    if ( (ref_value*(1-0.5*p))<=total_value and total_value<=(ref_value*(1+0.5*p)) )
      return 2
    elsif ( ((ref_value*(1-p) <= total_value) and (total_value < ref_value*(1-0.5*p))) or ((ref_value*(1+p*0.5)) < total_value and (total_value <= ref_value*(1+p))) )
      return 0
    elsif ( (total_value < (ref_value*(1-p))) or (total_value > ref_value*(1+p)))
      return -2
    end
  end



end
