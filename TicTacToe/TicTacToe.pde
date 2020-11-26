private GameBoard gameBoard;
private TurnRepository turns;
private WinLoseService winLose;

public Player playerOne;
public Player playerTwo;
public Computer computer;

void setup() {
  size(600, 600);

  playerOne = new Player(1, "X");
  playerTwo = new Player(2, "O");
  turns = new TurnRepository();
  gameBoard = new GameBoard(turns);
  winLose = new WinLoseService(); 
  computer = new Computer();
  // Sets up the game board
  gameBoard.reset();
}

void draw() {
  Player winPlayer = winLose.playerWon(gameBoard.getBoard());
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
  if (gameBoard.boardIsFull(gameBoard.getBoard())) {
    fill(255, 230, 0);
    textSize(50);
    text("Tie!", width/2, height/2);
    gameOver = true;
    return;
  }
}
