public class Objs
{
  private int posX, posY, velocidad, tipo;
  private PImage obs1, obs2, obs3;
  private PImage bueno1, bueno2, bueno3;

  public Objs(int posX, int posY, int tipo) {
    this.posX = posX;
    this.posY = posY;
    this.tipo = tipo;

    obs1 = loadImage("obs1.png"); 
    obs2 = loadImage("obs2.png");
    obs3 = loadImage("obs3.png");

    bueno1 = loadImage("bueno1.png"); 
    bueno2 = loadImage("bueno2.png");
    bueno3 = loadImage("bueno3.png");


    velocidad = (int)random(3, 6);
  }

  public void pintar()
  {
    switch(tipo) {
    case 1:
      image(obs1, posX, posY,60*0.8,70*0.8); 
      break;
    case 2:
      image(obs2, posX, posY,60*0.8,70*0.8);
      break;
    case 3:
      image(obs3, posX, posY,60*0.8,70*0.8);
      break;
    }
  }

  public void pintarBuenos()
  {
    switch(tipo) {
    case 1:
      image(bueno1, posX, posY,35,35);
      break;
    case 2:
     
      image(bueno2, posX, posY,35,35);
      break;
    case 3:
      image(bueno3, posX, posY,35,35);
      break;
    }
  }


  public void mover()
  {
    posX = posX - velocidad;
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

  public void setVelocidad(int velocidad)
  {
    this.velocidad = velocidad;
  }

  public int getTipo()
  {
    return tipo;
  }
}

