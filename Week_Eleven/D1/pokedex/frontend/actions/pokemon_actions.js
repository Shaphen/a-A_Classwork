// import * as ApiUtil from '../util/api_util.js';


export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON"

export const receiveAllPokemon = pokemon => ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
})


