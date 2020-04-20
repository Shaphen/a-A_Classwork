json.pokemon do
    json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :item_ids
end

json.items do
    json.set! @pokemon.items.id do
        json.extract! @pokemon.items, :ids, :name, :pokemon_id, :price, :happiness
    end
end