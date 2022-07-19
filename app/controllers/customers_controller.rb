require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # get all the customers from the customer_repo
    customers = @customer_repository.all
    # give the customers to the customers view to display
    @customers_view.display(customers)
  end

  def add
    # tell view to ask user for name
    name = @customers_view.ask_for('name')
    # tell view to ask user for address
    address = @customers_view.ask_for('address')
    # create an instance of a customer
    customer = Customer.new(name: name, address: address)
    # give the customer to the customer repository
    @customer_repository.create(customer)
  end
end
