class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @delivered = attributes[:delivered] || false # boolean
    @meal = attributes[:meal] # INSTANCE of a meal
    @customer = attributes[:customer] # INSTANCE of a customer
    @employee = attributes[:employee] # INSTANCE of a employee (rider)
  end

  def delivered?
    @delivered
  end

  def deliver!
    # changing what's in the delivered 'state'
    @delivered = true
  end

  def self.headers
    ['id', 'meal_id', 'customer_id', 'employee_id', 'delivered']
  end

end

Order.new(id: 1)
