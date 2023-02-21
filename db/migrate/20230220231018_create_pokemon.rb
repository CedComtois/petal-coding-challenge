class CreatePokemon < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.integer :number, index: true, null: false
      t.string :name, index: true, null: false
      t.string :type1, index: true, null: false
      t.string :type2, index: true
      t.integer :total, index: true, null: false
      t.integer :hp, index: true, null: false
      t.integer :attack, index: true, null: false
      t.integer :defense, index: true, null: false
      t.integer :special_attack, index: true, null: false
      t.integer :special_defense, index: true, null: false
      t.integer :speed, index: true, null: false
      t.integer :generation, index: true, null: false
      t.boolean :legendary, index: true, null: false, default: false

      t.timestamps
    end
  end
end
