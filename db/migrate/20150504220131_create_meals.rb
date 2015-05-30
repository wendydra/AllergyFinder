class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.references :user, index: true
      t.references :symptom, index: true

      t.timestamps
    end
  end
end
