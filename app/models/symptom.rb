class Symptom < ActiveRecord::Base
	has_many :meals
end
