class SessionsView < BaseView

  def welcome(employee)
    puts "Welcome #{employee.username}!"
  end

  def wrong_credentials
    puts 'Wrong username or password'
  end
end
