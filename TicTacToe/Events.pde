void keyPressed() {
  if (key == ' ')
    board.reset();
  gameOver = false;
}

boolean gameOver = false;
void mouseClicked() {
  if (gameOver) 
    return;
  if (turns.getCurrentPlayer() == playerTwo)
    return;

  int clickedRegion = getClickedSquare();
  if (!board.squareAvailable(clickedRegion))
    return;

  board.setValue(clickedRegion, "X");
  board.updateBoard();

  Player winPlayer = winLose.playerWon();
  if (winPlayer != null) {
    textAlign(CENTER, CENTER);
    fill (0, 255, 0);
    if (winPlayer.id == 2) 
      fill(255, 0, 0);
    textSize(50);
    text("Player "+ winPlayer.id + " has won!", width/2, height/2);
    gameOver = true;
    return;
  }
  if (board.boardIsFull()) {
    fill(255, 230, 0);
    textSize(50);
    text("Tie!", width/2, height/2);
    gameOver = true;
    return;
  }

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
