// Calculate all possible situations
// Calculate which paths will bring victory
// Narrow down when moves are played
// Go down shortest path

class Computer {

  void playBestMove(String[] board) {
    String[] bestBoard = null;
    int bestScore = -2;
    for (String[] child : getChildren(board)) {
      println("tes");
      int score = minimax(child, false, 2);
      println("test");
      if (gameOver(child) && score ==1 ) {
        gameBoard.setBoard(child);
        gameBoard.updateBoard();
        return;
      }
      println(score);
      if (score > bestScore) {
        bestBoard = child;
        bestScore = score;
      }
    }
    gameBoard.setBoard(bestBoard);
    gameBoard.updateBoard();
  }

  int minimax(String[] board, boolean maximizingPlayer, int depth) {
    if (gameOver(board) || depth == 0) {
      Player p = winLose.playerWon(board);
      if (p == playerOne) 
        return 1;
      if (p == playerTwo)
        return -1;
      return 0;
    }
    if (maximizingPlayer) {
      int value = -Integer.MIN_VALUE;
      for (String[] boardChild : getChildren(board)) 
        value = max(value, minimax(boardChild, false, depth-1));
      return value;
    } else {
      int value = -Integer.MAX_VALUE;
      for (String[] boardChild : getChildren(board)) 
        value = min(value, minimax(boardChild, true, depth -1));
      return value;
    }
  }

  boolean gameOver(String[] board) {
    Player winningPlayer = winLose.playerWon(board);
    return (winningPlayer != null || gameBoard.boardIsFull(board));
  }

  String[][] getChildren(String[] board) {

    int openSpaces = 0;
    for (String square : board) {
      if (square.equals(""))
        openSpaces++;
    }

    Set<Integer> checkedSpaces = new HashSet<Integer>();
    String[][] possibleBoards = new String[openSpaces][9];
    String[] boardClone = board.clone();
    for (int i = 0; i< openSpaces; i++) { 
      for (int j = 0; j <= 8; j++) {
        if (checkedSpaces.contains(j)) 
          continue;
        String square = boardClone[j]; 
        if (square.equals("")) {
          boardClone[j] = "O";
          possibleBoards[i] = boardClone;
          boardClone[j] = "";
          checkedSpaces.add(j);
          break;
        }
      }
    }
    return possibleBoards;
  }
}
