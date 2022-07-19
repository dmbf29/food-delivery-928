require 'csv'
require_relative '../models/customer'

class CustomerRepository

  private

  def build_instance(attributes)
    # attributes -> create an instance of a meal
    attributes[:id] = attributes[:id].to_i
    return Customer.new(attributes)
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # attributes -> create an instance of a customer

      @elements << customer
    end
    @next_id = @elements.any? ? @elements.last.id + 1 : 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << Customer.headers
      @elements.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
