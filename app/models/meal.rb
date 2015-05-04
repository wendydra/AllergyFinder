class Meal < ActiveRecord::Base
  belongs_to :user
  belongs_to :symptom
  has_many :ingredients
end
