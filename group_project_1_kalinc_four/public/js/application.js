window.playerId = 1;

$("td").click(function() {
  $clickedCell = $(this)
  var colNum = findColumn($clickedCell);
  var columnCells = $("." + colNum);

  var cellToFill = findCellToFill(columnCells);
  var playerPic = togglePlayer();
  if (cellToFill != null) {
    cellToFill.append( playerPic );
  }
  checkCols();
  checkRows();
  for (var i = -2 ; i <= 3; i++){
    checkDiag(i)
  }
});

var findCellToFill = function(columnCells) {
  for (var index = 0; index < columnCells.length; index++) {
    var cell = $(columnCells[index]);
    if (cell.find(".players").length === 0){
      var cellToFill = cell;
    }
  }

  //checks to see if column is full
  if (columnCells.first().find(".players").length >= 1) {
    cellToFill = null;
  }
  return cellToFill;
};

var findColumn = function(clickedCell) {
  return clickedCell.attr('class');
};

var togglePlayer = function() {
  var playerPic = document.createElement("div");
  var className = "players";
  if (window.playerId === 1 ) {
    playerPic.className = className + " player1";
    window.playerId = 2;
  } else if (window.playerId === 2) {
    playerPic.className = className + " player2";
    window.playerId =1;
  }
  return playerPic;
};

var checkCols = function() {
  for (var column = 1; column <= 7; column ++){
    var player1Counter = 0;
    var player2Counter = 0;
    var columnCells = $(".col_" + column);

    for (var index = 0; index <= 5; index ++) {
      var cell = $(columnCells[index])
      if (cell.find(".player1").length >= 1){
        player1Counter += 1;
        player2Counter = 0 ;
      } else if (cell.find(".player2").length >= 1) {
        player2Counter += 1;
        player1Counter = 0 ;
      } 
    }
    if (player1Counter >=4 || player2Counter >= 4) {
      alert("You have a winner!");
      location.reload();
    }
  }

}

var checkRows = function() {
  for (var row = 1; row <= 7; row ++){
    var player1Counter = 0;
    var player2Counter = 0;
    var rowCells = $($("#row_"+row).children());
    for (var index = 0; index <= 5; index ++) {
      var cell = $(rowCells[index])
      if (cell.find(".player1").length >= 1){
        player1Counter += 1;
        player2Counter = 0 ;
      } else if (cell.find(".player2").length >= 1) {
        player2Counter += 1;
        player1Counter = 0;
      } 
    }
    if (player1Counter >=4 || player2Counter >= 4) {
      alert("You have a winner!");
      location.reload();
    }
  }

}

var checkDiag = function(difference) {
  console.log(difference)
  var player1Counter = 0;
  var player2Counter = 0;
  for (var row = 1; row <= 7; row ++){
    colIndex = row + difference - 1;
    var rowCells = $($("#row_"+row).children());
    if ($($(rowCells[colIndex])).find(".player1").length == 1) {
      player1Counter += 1;
      player2Counter = 0;
    } else if ($($(rowCells[colIndex])).find(".player2").length == 1) {
      player2Counter += 1;
      player1Counter = 0;
    }

    if (player1Counter >=4 || player2Counter >= 4) {
      alert("You have a winner!");
      location.reload();
    }
  }
  for (var row = 7; row <= 1; row --){
    colIndex = row + difference - 1;
    var rowCells = $($("#row_"+row).children());
    if ($($(rowCells[colIndex])).find(".player1").length == 1) {
      player1Counter += 1;
      player2Counter = 0;
    } else if ($($(rowCells[colIndex])).find(".player2").length == 1) {
      player2Counter += 1;
      player1Counter = 0;
    }

    if (player1Counter >=4 || player2Counter >= 4) {
      alert("You have a winner!");
      location.reload();
    }
  }
}




//Make color change

var makeBlue = function() {
  $(this).css('background-color', '#007fff')
}

var makeGreen = function() {
  $(this).css('background-color', '#008000')
}

var makeWhite= function() {
  $(this).css('background-color', 'white')
}

if (window.playerId === 1) {
  // var $(column) = ('td.').attr('class')
  $('td').on({mouseover: makeBlue, mouseout: makeWhite})
}
else if (window.playerId === 2) {
  $('td').off({mouseover: makeBlue, mouseout: makeWhite})
  $('td').on({mouseover: makeGreen, mouseout: makeWhite})
}



