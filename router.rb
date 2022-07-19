class Router
  def initialize(???)
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
    when 1 then ??
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
    puts "1 - X"
    puts "0 - Stop and exit the program"
  end
end
