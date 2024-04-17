public class Jugador {

  private int posX, posY, velocidad;
  private float ancho, alto;
  private boolean mover;
  private PImage player [] = new PImage [3];
  private int numPlayer;
  public Jugador(int posX, int posY, int numPlayer) {
    this.numPlayer = numPlayer;
    this.posX = posX;
    this.posY = posY;
    this.ancho=318/4;
    this.alto=352/4;
    velocidad = 10;

    player[0] = loadImage ("tucan.png");
    player[1] = loadImage ("buho.png");
    player[2] = loadImage ("murcielago.png");
  }

  public void pintarJugador() {



    //fill(255, 0, 0);
    //rect(posX, posY, 40, 40);

    image (player[numPlayer], posX, posY, ancho, alto);
  }
  public void moverJugador() {
    posY = mouseY;
    if (posY < 120) {
      posY = 120;
    } else if ( posY > 330) {
      posY = 330;
    }
  }

  public int getPosX()
  {
    return posX;
  }

  public void setPosX(int posX)
  {
    this.posX = posX;
  }

  public int getPosY()
  {
    return posY;
  }

  public void setPosY(int posY)
  {
    this.posY = posY;
  }

  public int getVelocidad()
  {
    return velocidad;
  }

  public int getNumPlayer()
  {
    return numPlayer;
  }
  public void setNumPlayer(int numPlayer)
  {
    this.numPlayer = numPlayer;
  }

  public void setVelocidad(int velocidad)
  {
    this.velocidad = velocidad;
  }
}

