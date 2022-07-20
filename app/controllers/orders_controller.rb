require_relative '../views/orders_view'
require_relative '../views/employees_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end

  def list_undelivered_orders
    # get from repo
    orders = @order_repository.undelivered_orders
    # give to view
    @orders_view.display(orders)
  end

  def add
    # get the meals from the meal repo
    meals = @meal_repository.all
    # display the meals with meals_viw
    @meals_view.display(meals)
    # ask the user for the number (index)
    index = @orders_view.ask_for('number').to_i - 1
    # get the meal from the meals array
    meal = meals[index]

    # get the meals from the meal repo
    customers = @customer_repository.all
    # display the customers with customers_viw
    @customers_view.display(customers)
    # ask the user for the number (index)
    index = @orders_view.ask_for('number').to_i - 1
    # get the customer from the customers array
    customer = customers[index]

    # get the meals from the meal repo
    employees = @employee_repository.all_riders
    # display the employees with employees_viw
    @employees_view.display(employees)
    # ask the user for the number (index)
    index = @orders_view.ask_for('number').to_i - 1
    # get the employee from the employees array
    employee = employees[index]

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_my_orders(employee)
    # get from the repo
    orders = @order_repository.my_undelivered_orders(employee)
    # give to the view
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    # get from the repo
    orders = @order_repository.my_undelivered_orders(employee)
    # give to the view
    @orders_view.display(orders)
    # ask the number for the order you just delivered
    index = @orders_view.ask_for('number').to_i - 1
    order = orders[index]
    @order_repository.mark_as_delivered(order)
  end
end
