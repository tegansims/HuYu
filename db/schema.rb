# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_12_081333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boardcards", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_boardcards_on_board_id"
    t.index ["card_id"], name: "index_boardcards_on_card_id"
  end

  create_table "boardquestions", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_boardquestions_on_board_id"
    t.index ["question_id"], name: "index_boardquestions_on_question_id"
  end

  create_table "boards", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_boards_on_player_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "hair_color"
    t.string "hair_type"
    t.string "gender"
    t.string "hat"
    t.string "glasses"
    t.string "eye_color"
    t.string "facial_hair"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img_path"
    t.string "celeb_path"
  end

  create_table "games", force: :cascade do |t|
    t.string "game_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "winner"
    t.integer "loser"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "card_picked"
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "attribute_type"
    t.string "attribute_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
  end

  add_foreign_key "boardcards", "boards"
  add_foreign_key "boardcards", "cards"
  add_foreign_key "boardquestions", "boards"
  add_foreign_key "boardquestions", "questions"
  add_foreign_key "boards", "players"
  add_foreign_key "players", "games"
  add_foreign_key "players", "users"
end
