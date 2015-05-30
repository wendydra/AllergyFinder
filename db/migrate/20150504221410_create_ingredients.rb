class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.references :meal, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
