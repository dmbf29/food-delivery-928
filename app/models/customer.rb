class Customer
  attr_accessor :id, :name, :address

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @address = attributes[:address] # string
  end

  # Customer.headers
  def self.headers
    ['id', 'name', 'address']
  end
end

# cmd + d -> to select copies

# for case insensitive copies
# select then
# cmd + opt + c -> to get rid of other case
# cmd + d -> to select copies
