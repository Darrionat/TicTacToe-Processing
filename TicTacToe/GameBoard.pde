public class GameBoard {

  private TurnRepository turns; 

  public GameBoard(TurnRepository turns) {
    this.turns = turns;
  }

  private String[] board = {"", "", "", "", "", "", "", "", ""};

  public void draw() {
    strokeWeight(8);
    line(width/3, 0, width/3, height); 
    line(2*width/3, 0, 2*width/3, height);
    line(0, height/3, width, height/3);
    line(0, 2*height/3, width, 2*height/3);
  }

  public String[] getBoard() {
    return board;
  }
  
  public void setBoard(String[] board){
     this.board = board; 
  }
  
  void setValue(int squareNo, String value) {
    board[squareNo-1] = value;
  }

  public boolean squareAvailable(int square) {
    return board[square-1].equals("");
  }

  public void updateBoard() { 
    for (int i = 1; i <= 9; i++) {
      String square = board[i-1];
      int x = width/6;
      int y = height/6;
      if (i == 2 || i == 5 || i == 8)
        x = width/2;
      if (i == 3 || i == 6 || i == 9)
        x = 5*width/6;
      if (i == 4 || i == 5 || i == 6)
        y = height/2;
      if (i == 7 || i == 8 || i == 9)
        y = 5*height/6;

      textSize(175);
      textAlign(CENTER, CENTER);
      fill(36, 191, 242);
      text(square, x, y-25);
    }
  }

  public boolean boardIsFull(String[] board) {
    for (String square : board) {
      if (square.equals(""))
        return false;
    }
    return true;
  }

  public void reset() {
    for (int i = 0; i <= 8; i++) {
      board[i] = "";
    }
    turns.setCurrentPlayer(playerOne);
    background(200);
    draw();
  }
}
