//PFont estafue;
public class Logica
{
  //Variables 
  private Jugador jugador;
  private ArrayList<Objs> objetos;
  private ArrayList<Objs> buenos;
  private int contadorBolas, contadorBuenos, vidas, puntos, contadorJuego, posXFondo, posXFondoDos, velFondo, pantalla;
  private PImage fondo, fondoDos, fondomovil, banner, pantallaPrin, instrucciones, pantalla2, boton, seleccion, jug1, jug2, jug3, end, buho, murcielago, tucan;
  private PImage tucan_desa, buho_desa, murcielago_desa, corona;
  private boolean ok, blockbuho, blocktucan, blockmurcielago;
  private PFont Water;
  private int tucanscore, murcielagoscore, buhoscore;
  private boolean ganador;
  private int actualsegundos, actualmin, segprint, minprint, restartsegundos, restartmin, startsegundos, startmin;







  public Logica() {  
    //Arreglos para los objetos en el escenario 
    objetos = new ArrayList<Objs>();
    buenos = new ArrayList<Objs>();
    // se crea un nuevo objeto de tipo jugador
    jugador = new Jugador(50, 300, (int)random(0, 3));
    // aqui va el contador general del juego 
    //contadorJuego = 10000;
    vidas = 3;
    puntos = 0;

    // cargo las imagenes
    pantallaPrin = loadImage("pantallaPrin.png");
    instrucciones = loadImage("instrucciones.png");
    seleccion = loadImage("seleccion.png");

    jug1 = loadImage("Pj_buho.png");
    jug2 = loadImage("Pj_tucan.png");
    jug3 = loadImage("Pj_murcielago.png");

    // desabilitados
    buho_desa = loadImage("buho_desa.png");
    tucan_desa = loadImage("tucan_desa.png");
    murcielago_desa = loadImage("murcielago_desa.png");

    tucan = loadImage("jug1.png");
    buho = loadImage("jug2.png");
    murcielago = loadImage("jug3.png");

    end = loadImage ("end.png");
    ok =false;
    blockbuho =true;
    blocktucan=true;
    blockmurcielago=true;

    // estafue = createFont("Waterlily.ttf", 32); 

    fondo = loadImage("fondo.png");
    fondoDos = loadImage("fondo.png");
    fondomovil = loadImage ("Fondo_movil.png");
    boton = loadImage("boton.png");

    banner = loadImage("banner.png");
    corona = loadImage ("ganador.png");

    Water = createFont("water.ttf", 32); 

    ganador=false;

    //Las posiciones y velocidadp ara que el fondo se mueva
    posXFondo = width/2;
    posXFondoDos = width;
    velFondo = 1;
  }

  public void pintar() {

    // switch para las pantallas 
    switch(pantalla) {

    case 0:
      image(pantallaPrin, width/2, height/2, 627, 402);
      image(boton, width/2, 350, 104, 97);

      if (mouseX>279 && mouseX<350 && mouseY>315 && mouseY<385) {
        image(boton, width/2, 350, 104*1.2, 97*1.2);
      }

      break;
    case 1:
      // pantalla de instrucciones
      image(instrucciones, width/2, height/2);
      break;
    case 2:
      if (frameCount%2==0) {
        ok=true;
      }
      //Pantalla seleccion de jugador
      image(seleccion, width/2, height/2);


      if (blocktucan==true) {
        image(jug2, 315, 220, 245*0.6, 410*0.6);
      } else {
        image(tucan_desa, 315, 220, 245*0.6, 410*0.6);
      }

      if (blockbuho==true) {
        image(jug1, 115, 220, 245*0.6, 410*0.6);
      } else {
        image(buho_desa, 115, 220, 245*0.6, 410*0.6);
      }

      if (blockmurcielago==true) {
        image(jug3, 515, 220, 245*0.6, 410*0.6);
      } else {
        image(murcielago_desa, 515, 220, 245*0.6, 410*0.6);
      }

      if (pantalla==2 && mouseX>42 && mouseX<187 && mouseY>95 && mouseY<342&& ok==true && blockbuho==true) {
        fill (0, 0, 0, 80);
        rect(115, 220, 245*0.6, 410*0.6);
      }
      if (pantalla==2 && mouseX>240 && mouseX<384 && mouseY>95 && mouseY<342 && ok==true && blocktucan==true) {

        fill (0, 0, 0, 80);
        rect(315, 220, 245*0.6, 410*0.6);
      }

      if (pantalla==2 && mouseX>440 && mouseX<587 && mouseY>95 && mouseY<342 && ok==true && blockmurcielago==true) {
        fill (0, 0, 0, 80);
        rect(515, 220, 245*0.6, 410*0.6);
      }


      break;
    case 3: 




      pintarFondo();
      println(contadorJuego, contadorBolas, contadorBuenos);
      fill(255);
      textFont(Water);
      textSize(25);
      fill(255);
      text(vidas, 165, 50);
      text(puntos, 560, 50);
      // text(contadorJuego, 370, 50);

      //Iniciar contadores
      contadorJuego--;
      contadorBolas++;
      contadorBuenos++;

      // Condición para finalizar el juego

      if (19-minprint==0 && 60-segprint==0) {
        pantalla = 4;
      }


      // crea una fruta cada que el contador llega a 100 
      if (contadorBuenos > 100) {

        buenos.add(new Objs((int)random(615, 600), (int)random(150, 330), (int) random(1, 4) ));
        //Cuando se crea una nueva fruta el contador se reinicia
        contadorBuenos = 0;
      }

      // quita las frutas cuando toca al jugador
      for (int i = 0; i< buenos.size (); i++) {
        if (buenos.get(i).getPosX() < 0 ) {
          buenos.remove(i);
        } 
        buenos.get(i).pintarBuenos();
        buenos.get(i).mover();
      }
      // se crean obstaculos cada que el contador llega a 300 
      if (contadorBolas > 300) {
        objetos.add(new Objs((int)random(615, 600), (int)random(150, 300), (int) random(1, 4) ));
        contadorBolas = 0;
      }

      // condición para limitar la cantidad de obstaculos 
      if (objetos.size() > 3) {
        contadorBolas = 0;
      }
      // posiciones de los objetos que salen en el lienzo
      for (int i = 0; i< objetos.size (); i++) {
        if (objetos.get(i).getPosX() < 0) {
          objetos.get(i).setPosX(1100);
          objetos.get(i).setPosY((int)random(150, 300));
          objetos.get(i).setVelocidad((int)random(3, 6));
        }
        objetos.get(i).pintar();
        objetos.get(i).mover();
      }

      jugador.pintarJugador();
      jugador.moverJugador();
      ganarPuntos();
      perderVidas();
      break;
    case 4:
      fill(0);
      cursor();
      image (end, width/2, height/2 );
      image (buho, 100, height/2-50);
      rect(100, (height/2)+30, 150, 40);
      rect(300, (height/2)+30, 150, 40);
      rect(500, (height/2)+30, 150, 40);
      image (tucan, 300, height/2-50);
      image (murcielago, 500, height/2-50);
      fill (255);
      textFont(Water);
      textSize(20);
      if (blockbuho==false && blocktucan==false && blockmurcielago==false) {
        ganador=true;
      }

      if (ganador == true) {
        if (tucanscore>buhoscore && tucanscore>murcielagoscore) {
          image(corona, 300, 80, 360/4.5, 360/4.5);
          textSize(30);
          fill (255, 255, 0);
          text("¡Ganador!", 300, (height/2)+80);
        }

        if (buhoscore>tucanscore && buhoscore>murcielagoscore) {
          image(corona, 100, 80, 360/4.5, 360/4.5);
          textSize(30);
          fill (255, 255, 0);
          text("¡Ganador!", 100, (height/2)+80);
        }

        if (murcielagoscore>tucanscore && murcielagoscore>buhoscore) {
          image(corona, 500, 80, 360/4.5, 360/4.5);
          textSize(30);
          fill (255, 255, 0);
          text("¡Ganador!", 500, (height/2)+80);
        }
      }
      fill (255);
      textSize(20);
      text("puntaje: " + buhoscore, 100, (height/2)+40);
      text("puntaje: " +  tucanscore, 300, (height/2)+40);
      text("puntaje: " + murcielagoscore, 500, (height/2)+40);
      break;
    }
  }

  public void pintarFondo() {
    // se pinta y se mueve el fondo 

      image (fondomovil, posXFondo, height/2+38, 2338/1.8, 626/1.8);
    image (fondomovil, posXFondoDos+986, height/2+38, 2338/1.8, 626/1.8);
    image(banner, width/2, 43);


    // TIEMPO 

    println( mouseX, mouseY);
    actualsegundos = millis()/1000; 
    // en este paso cambio los milisegundos a minutos
    actualmin = millis() /1000 / 60; 
    // cuando ocurra el ciclo de los 60 segundos se reinician los segundos cambiando el minuto
    segprint = actualsegundos - restartsegundos; //segundos en la pantalla
    minprint = actualmin - restartmin; //minutos en la pantalla
    if (actualsegundos % 60 == 0) { //despues de 60 secs, vuelve a comenzar el segundero 
      restartsegundos = actualsegundos; 
      segprint =startsegundos; //vuelve a 0
    }
    text(nf(19-minprint, 2) + " : " + nf(60-segprint, 2), 377, 50);




    if ( jugador.getNumPlayer()==1) {
      image (buho, 40, 40, 93, 83);
    }
    if ( jugador.getNumPlayer()==0) {
      image (tucan, 40, 40, 93, 83);
    }
    if ( jugador.getNumPlayer()==2) {
      image (murcielago, 40, 40, 93, 83);
    }
    //    image(fondo, posXFondo, height/2 + 32);
    //    image(fondoDos, posXFondoDos + 314, height/2 + 32);
    posXFondo = posXFondo - velFondo;
    posXFondoDos = posXFondoDos - velFondo;


    if (posXFondo <  -2338/1.8 +width/2) {
      posXFondo = width/2 ;
    }

    if (posXFondoDos < -2338/1.8 +width ) {
      posXFondoDos = width ;
    }
  }


  public void ganarPuntos() {
    // acumular puntos 
    for (int i = 0; i < buenos.size (); i++) {
      if (dist(jugador.getPosX(), jugador.getPosY(), buenos.get(i).getPosX(), buenos.get(i).getPosY())< 40) {
        buenos.remove(i);
        if (buenos.get(i).getTipo() == 1) {
          puntos = puntos + 1;
        } else if (buenos.get(i).getTipo() == 2) {
          puntos = puntos + 3;
        } else if (buenos.get(i).getTipo() == 3) {
          puntos = puntos + 5;
        }
      }
    }
  }
  public void perderVidas() {
    // cuando el jugador se estrella con el obstaculo pierde una vida
    for (int i = 0; i < objetos.size (); i++) {

      if (dist(jugador.getPosX(), jugador.getPosY(), objetos.get(i).getPosX(), objetos.get(i).getPosY())< 60) {
        objetos.remove(i);
        vidas--;
        objetos.add(new Objs((int)random(615, 600), (int)random(120, 300), (int) random(1, 4) ));

        if (vidas == 0) {
          if ( jugador.getNumPlayer()==0) {
            blocktucan=false;
            tucanscore=puntos;
            buenos.remove(i);
              objetos.remove(i);
          }
          if ( jugador.getNumPlayer()==1) {
            blockbuho=false;
            buhoscore=puntos;
             buenos.remove(i);
               objetos.remove(i);
          }

          if ( jugador.getNumPlayer()==2) {
            blockmurcielago=false;
            murcielagoscore=puntos;
             buenos.remove(i);
               objetos.remove(i);
          }
          pantalla = 4;
        }
      }
    }
  }
  public void click() {


    if (pantalla==1) {
      pantalla++;
    }
    if (pantalla==0 && mouseX>279 && mouseX<350 && mouseY>315 && mouseY<385) {

      pantalla++;
    } 

    if (pantalla==2 && mouseX>42 && mouseX<187 && mouseY>95 && mouseY<342&& ok==true && blockbuho==true) {
      ok=false;
      pantalla++;

      jugador.setNumPlayer(1);
    } 

    if (pantalla==2 && mouseX>240 && mouseX<384 && mouseY>95 && mouseY<342 && ok==true && blocktucan==true) {

      ok=false;
      pantalla++;
      jugador.setNumPlayer(0);
    } 

    if (pantalla==2 && mouseX>440 && mouseX<587 && mouseY>95 && mouseY<342 && ok==true && blockmurcielago==true) {
      ok=false;
      pantalla++;
      jugador.setNumPlayer(2);
    } 

    if (pantalla==4 && ganador==false) {
      tucanscore=tucanscore;
      buhoscore=buhoscore;
      murcielagoscore=murcielagoscore;
      // contadorJuego = 10000;
      // tiempo restart
      actualsegundos = millis()/1000;
      actualmin = millis() /1000 / 60;
      segprint = actualsegundos - restartsegundos; 
      minprint = actualmin - restartmin;
      restartsegundos = actualsegundos;
      segprint =startsegundos; 
      restartmin = actualmin; 
      minprint = startmin; 


// contadores 

contadorJuego--;
      contadorBolas++;
      contadorBuenos++;





      vidas = 3;
      puntos = 0;
      posXFondo = width/2;
      posXFondoDos = width;
      pantalla=2;
    }
  }
}

