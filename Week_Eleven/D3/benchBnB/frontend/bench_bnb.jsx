import React from "react";
import ReactDOM from "react-dom";
// test imports
import * as sessionAPI from "./util/session_api_util"
// end test imports

document.addEventListener("DOMContentLoaded", () => {
    // test code
    window.signup = sessionAPI.postUser
    window.login = sessionAPI.postSession
    window.logout = sessionAPI.deleteSession
    // end test code
    
    const root = document.getElementById("root");
    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});

