class OrdersView < BaseView
  def display(orders) # an array of INSTANCES
    if orders.any?
      orders.each_with_index do |order, index|
        puts "#{index + 1} | #{order.customer.name} | #{order.customer.address}"
        puts "Meal: #{order.meal.name} | Rider: #{order.employee.username}"
      end
    else
      puts "No orders yet... 🍽"
    end
  end
end
