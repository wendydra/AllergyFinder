class AddAttachmentMealPicToMeals < ActiveRecord::Migration
  def self.up
    change_table :meals do |t|
      t.attachment :meal_pic
    end
  end

  def self.down
    remove_attachment :meals, :meal_pic
  end
end
