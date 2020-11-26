import java.util.Set;
import java.util.HashSet;

public class WinLoseService {

  // All possible winning lines
  private int[][] winningLines = {{1, 2, 3}, {1, 4, 7}, {1, 5, 9}, {2, 5, 8}, {3, 5, 7}, {3, 6, 9}, {4, 5, 6}, {7, 8, 9}};

  public Player playerWon(String[] board) {
    Set<Integer> pOneMoveSet = winLose.getPlayerMoveSet(board, playerOne); 
    if (setContainsWinningLine(pOneMoveSet)) 
      return playerOne;
    Set<Integer> pTwoMoveSet = winLose.getPlayerMoveSet(board, playerTwo); 
    if (setContainsWinningLine(pTwoMoveSet)) 
      return playerTwo;
    return null;
  }

  public boolean setContainsWinningLine(Set<Integer> playerMoveSet) {
    for (int[] winningLine : winningLines) {
      int amt = 0;
      for (int square : winningLine) {
        // Not a winning line, break to next
        if (!playerMoveSet.contains(square)) 
          break;

        amt++;
        // Has 3/3 marks in winningLine
        if (amt == 3) 
          return true;
      }
    }
    return false;
  }

  public Set<Integer> getPlayerMoveSet(String[] board, Player player) {
    Set<Integer> moveSet = new HashSet<Integer>();
    for (int i = 1; i <= 9; i++) {
      String mark = board[i -1];
      if (!mark.equals(player.mark))
        continue;
      moveSet.add(i);
    }
    return moveSet;
  }
}
