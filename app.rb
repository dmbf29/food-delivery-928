require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'router'

csv_file_path = 'data/meals.csv'
meal_repository = MealRepository.new(csv_file_path)
meals_controller = MealsController.new(meal_repository)

meal = Meal.new(name: 'helo', price: 12)
p meal
p meal.build_row
# csv_file_path = 'data/customers.csv'
# customer_repository = CustomerRepository.new(csv_file_path)
# customers_controller = CustomersController.new(customer_repository)

# router = Router.new(meals_controller, customers_controller)
# # router.run
