require 'byebug'
class Employee
  attr_reader :name, :boss, :salary

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    self.set_emps
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def set_emps
    new_emp = self
    until new_emp.boss.nil?
      new_emp.boss.employees << self
      new_emp = new_emp.boss
    end
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss = nil)
    super
    @employees = []
  end

  def bonus(multiplier)
    #sum salary of employees multiplied by multiplier
    (@employees.map { |el| el.salary }.inject(:+)) * multiplier
  end

end


ned = Manager.new("Ned", "Founder", 1_000_000)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
