public class TurnService {

  private int currentPlayer = 1;

  public int getCurrentPlayer() {
    return this.currentPlayer;
  }

  public void changeTurns() {
    if (currentPlayer == 1) {
      currentPlayer = 2;
      return;
    }
    currentPlayer = 1;
  }
}
