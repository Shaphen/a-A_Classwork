import { connect } from "react-redux";
import SessionForm from "./session_form";
import { signup } from "../../actions/session_actions"

const mapStateToProps = (state, ownProps) => ({
  errors: state.errors,
  formType: "signup"
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: (user) => dispatch(signup(user))
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm)

// if you joined my room welcome in! But...
// afk for bathroom lol