require "csv"

csv_text = URI.open("https://gist.githubusercontent.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6/raw/92200bc0a673d5ce2110aaad4544ed6c4010f687/pokemon.csv")
csv = CSV.parse(csv_text, headers: true, col_sep: ",", row_sep: :auto, skip_blanks: true)

pokemon_values = []

csv.each do |pokemon_value|
    pokemon_values << { number: pokemon_value[0], name: pokemon_value[1], type1: pokemon_value[2], type2: pokemon_value[3], total: pokemon_value[4], hp: pokemon_value[5], attack: pokemon_value[6], defense: pokemon_value[7], special_attack: pokemon_value[8], special_defense: pokemon_value[9], speed: pokemon_value[10], generation: pokemon_value[11], legendary: ActiveModel::Type::Boolean.new.cast(pokemon_value[12]) }
end

Pokemon.insert_all(pokemon_values)