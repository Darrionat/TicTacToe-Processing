public class GameBoard {

  private String[] board = {"", "", "", "", "", "", "", "", ""};


  public GameBoard() {
  }

  public String[] getBoard() {
    return board;
  }

  public void setValue(int square, String value) {
    board[square-1] = value;
  }

  public String getValue(int square) {
    return board[square -1];
  }

  public boolean squareAvailable(int square) {
    return board[square-1].equals("");
  }

  public void updateBoard() { 
    for (int i = 1; i <= 9; i++) {
      String square = getValue(i);
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

      textSize(50);
      textAlign(CENTER);
      text(square, x, y);
    }
  }

  public void clear() {
    for (int i = 1; i <= 9; i++) {
      setValue(i, "");
    }
  }
}
