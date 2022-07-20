require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def sign_in
    # tell the view to ask user for username
    username = @sessions_view.ask_for('username')
    # tell the view to ask user for password
    password = @sessions_view.ask_for('password')
    # ask the employee repo for an instance with a given username
    employee = @employee_repository.find_by_username(username)
    # if we get an employee, compare the password
    # if employee&.password == password
    if employee && employee.password == password
      @sessions_view.welcome(employee)
      employee
    else
      @sessions_view.wrong_credentials
      sign_in
    end
  end

end
