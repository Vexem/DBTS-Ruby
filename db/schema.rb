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

ActiveRecord::Schema.define(version: 20190308111044) do

  create_table "measurements", primary_key: ["patient_id", "created_at"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "patient_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
  end

  create_table "medicines", primary_key: "medicine_id", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "medicine_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicinetousers", primary_key: ["user_id", "medicine_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.bigint "medicine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicine_id"], name: "index_medicinetousers_on_medicine_id"
    t.index ["user_id"], name: "index_medicinetousers_on_user_id"
  end

  create_table "users", primary_key: "user_id", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "provider"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_foreign_key "measurements", "users", column: "patient_id", primary_key: "user_id"
  add_foreign_key "medicinetousers", "medicines", primary_key: "medicine_id"
  add_foreign_key "medicinetousers", "users", primary_key: "user_id"
end
