import React from 'react';


class TodoForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
    this.updateTodo = this.updateTodo.bind(this);
    this.toggleDone = this.toggleDone.bind(this);
  }

  updateTodo(event) {
    this.setState({
      title: event.currentTarget.value,
      body: event.currentTarget.value,
    });
  }

  toggleDone(event) {
    this.setState({ done: !this.state.done });
    console.log(this.state.done)
  }

  render() {
    return (
      <div>
        <label> Title
          <input onChange={ this.updateTodo } value={ this.state.title } />
        </label>

        <label> Body
          <input type='text' onChange={ this.updateTodo } value={ this.state.body } />
        </label>
        <button onClick={this.toggleDone}>Done</button> {this.state.done ? "✅" : ""}
        <button>Create new ToDo! </button>
      </div>
    )
  }
}

export default TodoForm;