require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bulbasaur = pokemons(:bulbasaur)
  end

  class PokemonsControllerIndexTest < PokemonsControllerTest
    test "should get all pokemons" do
      get pokemons_url
  
      body = JSON.parse(@response.body, symbolize_names: true)
  
      assert_response :success
      assert_equal body.first[:id], @bulbasaur.id
      assert_equal body.count, 1
    end
  end

  class PokemonsControllerShowTest < PokemonsControllerTest
    test "should return the pokemon" do
      get pokemon_url + "/#{ @bulbasaur.id }"

      body = JSON.parse(@response.body, symbolize_names: true)

      assert_response :success
      assert_equal body[:id], @bulbasaur.id
    end

    class PokemonsControllerShowNotFoundTest < PokemonsControllerShowTest
      test "should show an error" do
        wrong_id = 100000000
        get pokemon_url + "/#{wrong_id}"
  
        body = JSON.parse(@response.body, symbolize_names: true)
  
        assert_response :not_found
        assert_equal body[:errors], "The pokemon with id #{wrong_id} was not found"
      end
    end
  end

  class PokemonsControllerCreateTest < PokemonsControllerTest
    @@complete_pokemon_values = {
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

    test "should create the pokemon" do
      assert_difference("Pokemon.count") do
        post pokemon_url, params: @@complete_pokemon_values
      end
    end

    class PokemonsControllerCreateValueMissingTest < PokemonsControllerCreateTest
      test "should not create the pokemon" do
        assert_no_difference("Pokemon.count") do
          post pokemon_url, params: @@complete_pokemon_values.except(:name)
        end
      end
    end
  end

  class PokemonsControllerPatchTest < PokemonsControllerTest
    test "should update the pokemon" do
      new_name = "Not Bulbasaur"
      patch pokemon_url + "/#{ @bulbasaur.id }", params: { name: new_name }
      assert_equal @bulbasaur.reload.name, new_name
    end

    class PokemonsControllerPatchNotFoundTest < PokemonsControllerPatchTest
      test "should show an error" do
        wrong_id = 100000000
        patch pokemon_url + "/#{ wrong_id }", params: { name: "Any Name" }
  
        body = JSON.parse(@response.body, symbolize_names: true)
  
        assert_response :not_found
        assert_equal body[:errors], "The pokemon with id #{wrong_id} was not found"
      end
    end
  end

  class PokemonsControllerDeleteTest < PokemonsControllerTest
    test "should delete the pokemon" do
      assert_difference("Pokemon.count", -1) do
        delete pokemon_url + "/#{ @bulbasaur.id }"
      end
    end

    class PokemonsControllerDeleteNotFoundTest < PokemonsControllerDeleteTest
      test "should show an error" do
        wrong_id = 100000000
        delete pokemon_url + "/#{wrong_id}"
  
        body = JSON.parse(@response.body, symbolize_names: true)
  
        assert_response :not_found
        assert_equal body[:errors], "The pokemon with id #{wrong_id} was not found"
      end
    end
  end
end
