
const allTodos = (state) => {
  // console.log(state)
  // debugger
  let keys = Object.keys(state.todos);
  // console.log(keys)
  return keys.map( key => state.todos[key] );
}

export default allTodos;