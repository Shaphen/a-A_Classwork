import React from "react";
import { Link } from "react-router-dom"

export default ({ currentUser, logout }) => {

  const display = currentUser ? (
    <div>
      <p>Greetings { currentUser.username }</p>
      <button onClick={ logout }>Log Out</button>
    </div>
  ) : (
    <div>
      <Link to="/signup">Sign Up</Link>
      <Link to="/login">Log In</Link>
    </div>
  )
  
  return (
    <div>
      { display }
    </div>
  );
};
