class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.string :ingredient
      t.boolean :trigger
      t.references :user, index: true

      t.timestamps
    end
  end
end
