require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @employees
  end

  def find(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  def find_by_username(username)
    @employees.find do |employee|
      employee.username == username
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # attributes -> create an instance of a employee
      attributes[:id] = attributes[:id].to_i
      employee = Employee.new(attributes)
      @employees << employee
    end
    @next_id = @employees.any? ? @employees.last.id + 1 : 1
  end
end
