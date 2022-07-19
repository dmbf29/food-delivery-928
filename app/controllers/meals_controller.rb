require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # get all the meals from the meal_repo
    meals = @meal_repository.all
    # give the meals to the meals view to display
    @meals_view.display(meals)
  end

  def add
    # tell view to ask user for name
    name = @meals_view.ask_for('name')
    # tell view to ask user for price (change to i)
    price = @meals_view.ask_for('price').to_i
    # create an instance of a meal
    meal = Meal.new(name: name, price: price)
    # give the meal to the meal repository
    @meal_repository.create(meal)
  end
end
