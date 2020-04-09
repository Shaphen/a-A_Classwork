class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.prevWinner = [];
  }

  bindEvents() {
    let $li = $('li')
    let that = this
    $li.each(function(index) {
      $(this).on("click", () => {
        console.log($(this).data("pos"));
        // alert("it works")
        that.game.playMove($(this).data("pos"))
        that.makeMove($(this));
      
      })
    });

  }

  makeMove($square) {
    let pos = $square.data("pos");
    let mark = this.game.board.grid[pos[0]][pos[1]];
    if(mark === "x"){
      $square.removeClass("initial");
      $square.addClass("x");
    } else {
      $square.removeClass("initial");
      $square.addClass("o");
    }
    $square.text(mark);

    if (this.game.isOver()) {
      if (this.game.winner()) {
        this.prevWinner.push(mark)
        if (this.prevWinner.length === 2) {
          this.printSaltyMessage(mark)
        } else if (this.prevWinner.length === 3) {
          let $p = $('<h1></h1>');
          $p.addClass("congrats");
          $p.text(`Really...`);
          $('ul').append($p);
        } else if (this.prevWinner.length === 4) {
          let $p = $('<h1></h1>');
          $p.addClass("congrats");
          $p.text(`This isn't funny anymore`);
          $('ul').append($p);
        } else if (this.prevWinner.length >= 3) {
          let $p = $('<h1></h1>');
          $p.addClass("congrats");
          $p.text(`HAHA! YOU RAN OUT OF SPACE`);
          $('ul').append($p);
        } else {
          let $p = $('<h1></h1>');
          $p.addClass("congrats");
          $p.text(`Congratlations ${mark}. You win!`);
          $('ul').append($p);
        }
      } else {
        let $p = $('<h1></h1>');
        $p.addClass("congrats");
        $p.text(`Congratlations X and O. You both lose!`);
        $('ul').append($p);
      }
    }

  }


  printSaltyMessage(mark) {
    if (mark === "x"){
        let $p = $('<h1></h1>');
        $p.addClass("congrats");
      $p.text(`Looks like X doesn't know how to accept reality`);
        $('ul').append($p);
    }else {
      let $p = $('<h1></h1>');
      $p.addClass("congrats");
      $p.text(`Looks like O doesn't know how to accept reality`);
      $('ul').append($p);
    }
  }



  setupBoard() {
    //make blank HTMl ele
    let $ul = $("<ul></ul>");
    //add a classname to ele
    $ul.addClass("board");

  for (let i = 0; i < 3; i++) {
    for (let j = 0 ; j < 3; j++) {
      let $li = $("<li></li>");
      $li.addClass("square");
      $li.addClass("initial");
      $li.data("pos", [i,j] );
      //append sticks arg onto thing invoking it
      $ul.append($li);
    }
  }

  //appending it onto something in HTML file
  this.$el.append($ul);
  }
}



// View.prototype.setupBoard = function(){
//   let $ul = $("<ul></ul>");
//   $ul.addClass("board");

//   for (let i = 0; i < 9; i++) {
//     let $li = $("<li></li>");
//     $li.addClass("square");
//     $ul.append($li);
//   }

//   let $figure = $("figure");
//   $figure.append($ul);
// }

module.exports = View;
