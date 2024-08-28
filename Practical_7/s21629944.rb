class Employee
  # Attribute reader for the earnings instance variable
  attr_reader :earnings

  # Initialize the instance variables: earnings, baseSalary, and baseSalaryPaid
  def initialize(base_salary = 20_000.00)
    @earnings = 0.0
    @base_salary = base_salary
    @base_salary_paid = false
  end

  # Method to pay the employee their base salary at the end of a month
  def pay_employee
    if @base_salary_paid
      puts "Base salary already paid this month."
    else
      @earnings += @base_salary
      @base_salary_paid = true
      #puts "Base salary paid: #{@base_salary}"
    end
  end

  # Method to start a new month (reset baseSalaryPaid to false)
  def new_month
    @base_salary_paid = false
    #puts "New month started. Base salary status reset."
  end
end

# Example usage of the Employee class:
# Specify a custom base salary (optional)
#employee = Employee.new(25_000.00)
# Should be 0.0 initially since we have yet to pay the salary
#puts "Employee's earnings: #{employee.earnings}"
# Pay the base salary
#employee.pay_employee 
# Should be the base salary
#puts "Employee's earnings: #{employee.earnings}" 
# Try paying again (should show message)
#employee.pay_employee 
# Start a new month
#employee.new_month 


class Manager < Employee
  # Initialize the Manager class with an additional bonus
  def initialize(bonus, base_salary = 20_000.00)
    super(base_salary) # Call the parent class constructor
    @bonus = bonus
    @teams_paid = 0
  end

  # Override the pay_employee method to include the bonus
  def pay_employee
    if @teams_paid.zero?
      super
      @earnings += @bonus
      @teams_paid += 1
      @teams_paid = 0
      #puts "Bonus paid to Manager: #{@bonus}"
    end
  end

  # Override the new_month method to reset the team payment count
  def new_month
    super
    @teams_paid = 0
  end
end

# Example usage for the Manager class:
# Specify bonus and base salary
#manager = Manager.new(5_000.00, 30_000.00)
# Should be 0.0 initially
#puts "Manager's earnings: #{manager.earnings}" 
# Pay the base salary and bonus
#manager.pay_employee 
# Should be base salary + bonus
#puts "Manager's earnings: #{manager.earnings}" 
# Pay only the bonus (no base salary)
#manager.pay_employee 


class Programmer < Employee
  def initialize(percentage)
    # Calculate the salary based on the percentage (e.g., 0.5 for 50%)
    #computed_salary = 20_000.00 * percentage
    computed_salary = 20_000.00 * percentage
    super(computed_salary) # Call the parent class constructor
  end
end

# Example usage for the Programmer class:
# Create a programmer with 75% of the base salary
# programmer = Programmer.new(0.75) 
# Should be 75% of the base salary
# puts "Programmer's earnings: #{programmer.earnings}" 


class Team
  def initialize
    @employees = [] # Initialize an empty array to store team members
  end

  # Method to add an individual employee to the team
  def add_member(employee)
    if @employees.length >= 2
      raise "Maximum team size reached. Cannot add more employees."
    else
      @employees << employee
      puts "#{employee.class} added to the team."
    end
  end

  # Method to pay the employees of the team
  def pay_team
    @employees.each do |employee|
      employee.pay_employee
    end
  end

  # Method to start a new month for the employees of the team
  def new_month
    @employees.each do |employee|
      employee.new_month
    end
  end

  # Method to print earnings for each team member
  def print_earnings
    @employees.each do |employee|
      puts "#{employee.class} earnings: #{employee.earnings}"
    end
  end
end

# Example usage for the Team class:
#team = Team.new
#manager1 = Manager.new(5_000.00, 30_000.00)
#manager2 = Manager.new(3_000.00, 25_000.00)
#programmer1 = Programmer.new(0.75)
#programmer2 = Programmer.new(0.6)
#team.add_member(manager1)
#team.add_member(manager2)
#team.add_member(programmer1)
#team.add_member(programmer2)
#team.pay_team
#team.print_earnings
#team.new_month


# Create two teams
team1 = Team.new
team2 = Team.new

# Prompt the user for manager details
print "Enter the manager's base salary: "
manager_base_salary = gets.chomp.to_f
print "Enter the manager's bonus: "
manager_bonus = gets.chomp.to_f

# Create the manager
manager = Manager.new(manager_bonus, manager_base_salary)

# Prompt the user for programmer details and add them to their respective teams
print "Enter the programmer's salary percentage for team1 (e.g., 0.75 for 75%): "
programmer1_percentage_team1 = gets.chomp.to_f
programmer1_team1 = Programmer.new(programmer1_percentage_team1)
team1.add_member(programmer1_team1)

programmer2_team1 = Programmer.new(programmer1_percentage_team1)
team1.add_member(programmer2_team1)

print "Enter the programmer's salary percentage for team2 (e.g., 0.75 for 75%): "
programmer1_percentage_team2 = gets.chomp.to_f
programmer1_team2 = Programmer.new(programmer1_percentage_team2)
team2.add_member(programmer1_team2)

programmer2_team2 = Programmer.new(programmer1_percentage_team2)
team2.add_member(programmer2_team2)

# Prompt the user to pay the teams for additional months
loop do
  print "Enter 'y' to pay the teams for another month, or 'n' to end: "
  choice = gets.chomp.downcase

  break if choice == 'n'

  if choice == 'y'
    team1.pay_team
    team2.pay_team
    manager.pay_employee
    team1.new_month
    team2.new_month
    manager.new_month
  else
    puts "Invalid choice. Please try again."
  end
end

# Print the final earnings of each team member
puts "Final earnings:"
puts "Earnings for Team 1:"
team1.print_earnings
puts "Earnings for Team 2:"
team2.print_earnings
puts "Earnings for Manager:"
puts "Manager earnings: #{manager.earnings}"