class Symptom < ActiveRecord::Base
  	has_many :reactions
  	has_many :meals, through: :reactions
end
