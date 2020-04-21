import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';
import { bindActionCreators } from 'redux';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state)

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      action.pokemon.forEach(mon => {
        nextState[mon.id] = mon;
      });
      return nextState;
      // return Object.assign(nextState, action.pokemon);
    default:
      state;
  }
  
}

export default pokemonReducer;