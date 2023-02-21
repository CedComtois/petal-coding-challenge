require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  describe "Validations" do
    before do
      @complete_pokemon_values = {
        number: 12,
        name: "Not Bulbasaur",
        type1: "Grass",
        total: 123,
        hp: 123,
        attack: 10,
        defense: 10,
        special_attack: 12,
        special_defense: 12,
        speed: 100,
        generation: 1234
      }
    end

    describe "when all values are given and valid" do
      it "should be valid" do
        pokemon = Pokemon.new(@complete_pokemon_values)
        assert pokemon.valid?
      end
    end

    describe "when name is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:name))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:name], ["can't be blank"]
      end
    end

    describe "when number is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:number))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:number], ["can't be blank"]
      end
    end

    describe "when type1 is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:type1))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:type1], ["can't be blank"]
      end
    end

    describe "when total is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:total))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:total], ["can't be blank"]
      end
    end

    describe "when hp is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:hp))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:hp], ["can't be blank"]
      end
    end

    describe "when attack is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:attack))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:attack], ["can't be blank"]
      end
    end

    describe "when defense is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:defense))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:defense], ["can't be blank"]
      end
    end

    describe "when special_attack is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:special_attack))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:special_attack], ["can't be blank"]
      end
    end

    describe "when special_defense is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:special_defense))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:special_defense], ["can't be blank"]
      end
    end

    describe "when speed is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:speed))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:speed], ["can't be blank"]
      end
    end

    describe "when generation is missing" do
      it "should be invalid" do
        pokemon = Pokemon.new(@complete_pokemon_values.except(:generation))
        assert_equal pokemon.valid?, false
        assert_equal pokemon.errors[:generation], ["can't be blank"]
      end
    end
  end
end
