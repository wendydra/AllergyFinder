class Ingredient < ActiveRecord::Base
  belongs_to :meal
  belongs_to :category
end
