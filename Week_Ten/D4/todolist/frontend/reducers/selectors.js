
const allTodos = (state) => {
  console.log(state)
  let keys = Object.keys(state);
  console.log(keys)
  return keys.map( key => state[key] );
}

export default allTodos;