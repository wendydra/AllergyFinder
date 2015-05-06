class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.references :meal, index: true
      t.references :symptom, index: true

      t.timestamps
    end
  end
end
