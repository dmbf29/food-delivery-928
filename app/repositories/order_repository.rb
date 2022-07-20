class OrderRepository

  private
  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # attributes -> create an instance of a order
      attributes[:id] = attributes[:id].to_i
      # we need to ask the meal_repo for a meal the meal_id
      # we need to ask the customer_repo for a customer the customer_id
      # we need to ask the employee_repo for a employee the employee_id
      order = Order.new(attributes)
      @orders << order
    end
    @next_id = @orders.any? ? @orders.last.id + 1 : 1
  end
end
