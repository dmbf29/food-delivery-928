require 'csv'
require_relative '../models/customer'

class CustomerRepository < BaseRepository
  private

  def build_instance(attributes)
    # attributes -> create an instance of a meal
    attributes[:id] = attributes[:id].to_i
    return Customer.new(attributes)
  end
end
