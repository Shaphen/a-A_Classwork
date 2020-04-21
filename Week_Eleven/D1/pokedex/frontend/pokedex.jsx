import React from 'react';
import ReactDOM from 'react-dom';
// test code
import * as ApiUtil from './util/api_util';
import { receiveAllPokemon } from './actions/pokemon_actions.js'
import configureStore from './store/store'
// end test code

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  // test code
  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = ApiUtil.fetchAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // end test code
  ReactDOM.render(<h1>it worked!</h1>, root)
});
