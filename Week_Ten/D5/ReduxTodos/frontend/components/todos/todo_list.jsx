import React from 'react';
import TodoListItem from './todo_list_item'
import TodoForm from '../todo_list/todo_form'
// import receiveTodo from ''

export default (props) => {
  // debugger
  // console.log(props)
  return (
    <div>
      <h1> List of Todos </h1>
      <TodoForm />
      <ul>
        {
          props.todos.map(todo => {
            return (
              <TodoListItem {...todo}/> // why does spread operator work here?
            )
          })
        }
      </ul>
    </div>
  )
}