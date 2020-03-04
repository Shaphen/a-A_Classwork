class Employee
  attr_reader :name,:title,:salary,:boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multi)
    bonus = (salary) * multi
  end

end


class Manager < Employee
  # attr_writer :minions

  def initialize(name, title, salary, boss)
    super
    @minions = []
  end

  def add_minion(minion)
    @minions << minion
  end

  def bonus(multi)
      total_sals = 0
      @minions.each {|mini| total_sals += mini.salary}
      total_sals * multi
  end
  
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.add_minion(darren)
darren.add_minion(shawna)
darren.add_minion(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000