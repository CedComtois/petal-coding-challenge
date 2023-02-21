# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_20_231018) do
  create_table "pokemons", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", null: false
    t.string "type1", null: false
    t.string "type2"
    t.integer "total", null: false
    t.integer "hp", null: false
    t.integer "attack", null: false
    t.integer "defense", null: false
    t.integer "special_attack", null: false
    t.integer "special_defense", null: false
    t.integer "speed", null: false
    t.integer "generation", null: false
    t.boolean "legendary", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attack"], name: "index_pokemons_on_attack"
    t.index ["defense"], name: "index_pokemons_on_defense"
    t.index ["generation"], name: "index_pokemons_on_generation"
    t.index ["hp"], name: "index_pokemons_on_hp"
    t.index ["legendary"], name: "index_pokemons_on_legendary"
    t.index ["name"], name: "index_pokemons_on_name"
    t.index ["number"], name: "index_pokemons_on_number"
    t.index ["special_attack"], name: "index_pokemons_on_special_attack"
    t.index ["special_defense"], name: "index_pokemons_on_special_defense"
    t.index ["speed"], name: "index_pokemons_on_speed"
    t.index ["total"], name: "index_pokemons_on_total"
    t.index ["type1"], name: "index_pokemons_on_type1"
    t.index ["type2"], name: "index_pokemons_on_type2"
  end

end
