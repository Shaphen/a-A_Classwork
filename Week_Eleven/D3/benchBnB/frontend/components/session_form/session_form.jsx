import React from "react"

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    state = {
      username: "",
      password: ""
    }
  }

  handleChange(type){
    return (e) => {
      this.setState({ [type]: e.target.value })
    }
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  render() {
    const errors = []
    if (this.props.errors){
      errors = this.props.errors
    }

    return(
      <div>
        <h1>
          {this.props.formType}
        </h1>
        <form>
          <ul>
            {
              errors.map(error => (
                <li>{ error }</li>
                )
              )
            }
          </ul>
          <label>Username:
            <input
              type="text"
              value={ this.state.username }
              onChange={ this.handleChange('username') }
            />
          </label>
          <label>Password:
            <input
              type="text"
              value={this.state.password}
              onChange={this.handleChange('password')}
            />
          </label>
          <button onSubmit={ this.handleSubmit }> Submit </button>
        </form>
      </div>
    )
  }
}

export default SessionForm;