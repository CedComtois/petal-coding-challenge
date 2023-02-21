# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

csv_file_path ||= File.read("./db/pokemon.csv")
csv ||= CSV.parse(csv_file_path, col_sep: ",", row_sep: :auto, skip_blanks: true)

pokemon_values = []

csv.each do |pokemon_value|
    pokemon_values << { number: pokemon_value[0], name: pokemon_value[1], type1: pokemon_value[2], type2: pokemon_value[3], total: pokemon_value[4], hp: pokemon_value[5], attack: pokemon_value[6], defense: pokemon_value[7], special_attack: pokemon_value[8], special_defense: pokemon_value[9], speed: pokemon_value[10], generation: pokemon_value[11], legendary: ActiveModel::Type::Boolean.new.cast(pokemon_value[12]) }
end

Pokemon.insert_all(pokemon_values)