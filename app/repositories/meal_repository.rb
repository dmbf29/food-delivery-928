require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository

  private

  def build_instance(attributes)
    # attributes -> create an instance of a meal
    attributes[:id] = attributes[:id].to_i
    attributes[:price] = attributes[:price].to_i
    meal = Meal.new(attributes)
  end
end
