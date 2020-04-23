import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store"
// test imports
import * as sessionAPI from "./util/session_api_util"
// end test imports

document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();
    window.getState = store.getState;
    const root = document.getElementById("root");
    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
    
    // test code
    window.signup = sessionAPI.postUser
    window.login = sessionAPI.postSession
    window.logout = sessionAPI.deleteSession
    window.dispatch = store.dispatch
    // end test code
});

