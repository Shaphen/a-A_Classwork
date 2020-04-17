import React from 'react';

const TodoListItem = (props) => {
  console.log(props)
  return (
    <li>{ props.title }</li>
  )
}

export default TodoListItem;