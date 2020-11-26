void keyPressed() {
  if (key == ' ')
    gameBoard.reset();
  gameOver = false;
}

boolean gameOver = false;
void mouseClicked() {
  if (gameOver) 
    return;
  if (turns.getCurrentPlayer() == playerTwo) {
    computer.playBestMove(gameBoard.board);
  } else {
    int clickedRegion = getClickedSquare();
    if (!gameBoard.squareAvailable(clickedRegion))
      return;
  }
  gameBoard.setValue(getClickedSquare(), "X");
  gameBoard.updateBoard();
  turns.togglePlayer();
}



private int getClickedSquare() {
  // 1, 2 , 3
  if (mouseY <= height/3) {
    if (mouseX <= width/3)
      return 1;
    if (mouseX > 2*width/3)
      return 3;
    return 2;
  }
  // 7, 8, 9
  if (mouseY >= 2*height/3) {
    if (mouseX <= width/3)
      return 7;
    if (mouseX > 2*width/3)
      return 9;
    return 8;
  }
  // 4, 5, 6
  if (mouseX <= width/3)
    return 4;
  if (mouseX > 2*width/3)
    return 6;
  return 5;
}
