private GameBoard board;
private TurnService turns;
void setup() {
  size(600, 600);
  background(155);

  board = new GameBoard();
  turns = new TurnService();
}

void draw() {
  drawBoard();
}

void drawBoard() {
  line(width/3, 0, width/3, height); 
  line(2*width/3, 0, 2*width/3, height);

  line(0, height/3, width, height/3);
  line(0, 2*height/3, width, 2*height/3);
}

void mouseClicked() {
  int clickedRegion = getRegion();
  if (!board.squareAvailable(clickedRegion))
    return;
  String marker = "X";
  if (turns.getCurrentPlayer() == 2)
    marker = "O";
    
  board.setValue(clickedRegion, marker);
  board.updateBoard();
  turns.changeTurns();
}

int getRegion() {
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
