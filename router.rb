class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to the Le Wagon Delivery!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then stop
    else
      puts "Please press 1, 2, 3, 4, or 0"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Display all meals"
    puts "2 - Add a meal"
    puts "3 - Display all customers"
    puts "4 - Add a customer"
    puts "0 - Stop and exit the program"
  end
end
