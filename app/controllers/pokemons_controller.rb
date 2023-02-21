class PokemonsController < ApplicationController
  # No services have been used due to the small size of the queries, but in a bigger environment I would use services and/or query managers when you start using includes, joins, etc.
  def index
    render json: Pokemon.all
  end

  def show
    pokemon = Pokemon.find_by(id: params[:id])

    if pokemon
      render json: pokemon
    else
      render json: { errors: I18n.t("errors.pokemons.not_found", id: params[:id]) }, status: 404
    end
  end

  def create
    permitted = params.permit(:name, :number, :type1, :type2, :total, :hp, :attack, :defense, :special_attack, :special_defense, :speed, :generation, :legendary, :types)

    pokemon = Pokemon.new(permitted)

    unless pokemon.save
      render json: { errors: pokemon.errors.map { |error| error.full_message } }, status: 412
    end
  end

  def patch
    pokemon = Pokemon.find_by(id: params[:id])

    unless pokemon
      return render json: { errors: I18n.t("errors.pokemons.not_found", id: params[:id]) }, status: 404
    end

    permitted = params.permit(:name, :number, :type1, :type2, :total, :hp, :attack, :defense, :special_attack, :special_defense, :speed, :generation, :legendary, :types)

    unless pokemon.update(permitted)
      render json: { errors: pokemon.errors.map { |error| error.full_message } }, status: 412
    end
  end

  def delete
    pokemon = Pokemon.find_by(id: params[:id])

    unless pokemon
      return render json: { errors: I18n.t("errors.pokemons.not_found", id: params[:id]) }, status: 404
    end

    pokemon.delete
  end
end
