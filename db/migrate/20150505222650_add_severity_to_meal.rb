class AddSeverityToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :severity, :integer
  end
end
