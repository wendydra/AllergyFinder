# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150507182430) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.integer  "meal_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["category_id"], name: "index_ingredients_on_category_id"
  add_index "ingredients", ["meal_id"], name: "index_ingredients_on_meal_id"

  create_table "meals", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meal_pic_file_name"
    t.string   "meal_pic_content_type"
    t.integer  "meal_pic_file_size"
    t.datetime "meal_pic_updated_at"
  end

  add_index "meals", ["user_id"], name: "index_meals_on_user_id"

  create_table "reactions", force: true do |t|
    t.integer  "meal_id"
    t.integer  "symptom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "severity"
  end

  add_index "reactions", ["meal_id"], name: "index_reactions_on_meal_id"
  add_index "reactions", ["symptom_id"], name: "index_reactions_on_symptom_id"

  create_table "symptoms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "triggers", force: true do |t|
    t.string   "ingredient"
    t.boolean  "trigger"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "triggers", ["user_id"], name: "index_triggers_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
