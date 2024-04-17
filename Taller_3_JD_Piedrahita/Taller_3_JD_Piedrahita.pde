Logica app;

void setup()
{
  size(625, 400);
  smooth();
  noStroke();


  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);

  app = new Logica();
}

void draw()
{

  background(255);
  app.pintar();
}

void mousePressed() {
  app.click();

 
}

