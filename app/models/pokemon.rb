class Pokemon < ApplicationRecord
    validates :name, :number, :type1, :total, :hp, :attack, :defense, :special_attack, :special_defense, :speed, :generation, presence: true
end