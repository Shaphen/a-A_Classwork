const FollowToggle = require("./follow_toggle.js");

$(() => {
  let $buttons = $(".follow-toggle"); //all the buttons
  
  $buttons.each(function(idx, button){
    new FollowToggle(button);
  });
});
