import { RECEIVE_TODOS } from "../actions/todo_actions";
import { RECEIVE_TODO } from "../actions/todo_actions";

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

const toDosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state)
  
  switch (action.type) {
    case RECEIVE_TODOS:
      for (let i = 0; i < action.todos.length; i++) {
          nextState[action.todos[i].id] = action.todos[i];
      }
      return nextState;
    case RECEIVE_TODO:
      nextState[action.todo.id] = action.todo;
      return nextState;
    default:
      return state;
  }
}

export default toDosReducer;