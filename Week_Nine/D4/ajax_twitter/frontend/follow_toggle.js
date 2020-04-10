

class FollowToggle {
    constructor(el, options) {
      this.$el = $(el);
      this.userId = this.$el.data("userId");
      this.followState = this.$el.data("initialFollowState");
      this.render();
      // debugger
    }

    // method in this class
    // render (){}
    // method, url, data

    render() {
      // let $button = $(".follow-toggle");
      console.log(this.followState);
      if (this.followState === "unfollowed"){
        debugger
        this.$el.text("Follow!");
      } else {
        this.$el.text("Unfollow!");
      }
    }
    
}

module.exports = FollowToggle;
