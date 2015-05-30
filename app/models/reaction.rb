class Reaction < ActiveRecord::Base
  belongs_to :meal
  belongs_to :symptom
end
