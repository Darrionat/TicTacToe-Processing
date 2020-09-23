public class TurnRepository {

  private Player currentPlayer;

  public TurnRepository() {
    currentPlayer = playerOne;
  }

  public Player getCurrentPlayer() {
    return this.currentPlayer;
  }  

  public void setCurrentPlayer(Player player) {
    this.currentPlayer = player;
  }

  public void togglePlayer() {
    if (currentPlayer.equals(playerOne)) {
      currentPlayer = playerTwo;
    } else {
      currentPlayer = playerOne;
    }
  }
}
