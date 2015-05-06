class RemoveSymptomFromMeal < ActiveRecord::Migration
  def change
    remove_column :meals, :symptom_id, :integer
    remove_column :meals, :severity, :integer
  end
end
