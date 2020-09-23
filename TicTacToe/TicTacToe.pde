private GameBoard board;
private TurnRepository turns;
private WinLoseService winLose;

public Player playerOne;
public Player playerTwo;

void setup() {
  size(600, 600);

  playerOne = new Player(1, "X");
  playerTwo = new Player(2, "O");
  turns = new TurnRepository();
  board = new GameBoard(turns);
  winLose = new WinLoseService(); 

  // Sets up the game board
  board.reset();
}

void draw() {
}
