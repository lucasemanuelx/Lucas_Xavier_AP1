int l, a;
int  count;
int car1, car2, car3;
int e;
boolean over, fechado = true;
Carro carro1 = new Carro();
Carro carro2 = new Carro();
Carro carro3 = new Carro();
Semaforo semaforo = new Semaforo();

void setup() {
  size(900, 450);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(height/30);
  background(360);
  noStroke();
  l = width;
  a = height;

  car1 = l/30 ;
  car2 = l/30; 
  car3 = l/30;
}

void draw() {
  if (!over) {
    cenario();
    carro1.display(car1, a*0.31667, color(359, 43, 100), "1");
    carro2.display(car2, a/2, color(203, 43, 95), "2");
    carro3.display(car3, a*0.6833333333, color(59, 55, 90), "3");
    semaforo.display();
    semaforo.countDown();
    ehFechado();
    resultado();
  } else
    replay();
}

class Carro {
  void display(int x, float y, color c, String s) {
    fill(c);
    rect(x, y, l/20, a/15, 10);
    fill(0);
    rect(x-11, y-a/23, 15, 10, 5);
    rect(x-11, y+a/23, 15, 10, 5);
    rect(x+l/80, y-a/23, 15, 10, 5);
    rect(x+l/80, y+a/23, 15, 10, 5);
    fill(360);
    rect(x, y, l/55, a/20, 20);
    fill(0);
    text(s, x, y+5);
    fill(48, 20, 100);
    ellipse(x+18, y-7, 6, 8);
    ellipse(x+18, y+7, 6, 8);
  }


  void andar() {
    car1 = car1 + int (random(0, 5)); //velocidade carro1
    car2 = car2 + int (random(0, 5)); //velocidade carro2
    car3 = car3 + int (random(0, 5)); //velocidade carro3
  }
}

class Semaforo {
  void display() {
    noFill();
    stroke(60);
    strokeWeight(l/75);
    rect(l*0.15, a/60, l/4.8, a/6);
    noStroke();
    fill(90);
    rect(l*0.09166, a/10, l/20, a/6);
    rect(l/6.666, a/10, l/20, a/6);
    rect(l/4.8, a/10, l/20, a/6);

    fill(0, 78, 94);
    ellipse(l*0.09166, a*0.06, l/37.5, a/18.75);
    ellipse(l*0.15, a*0.06, l/37.5, a/18.75);
    ellipse(l/4.8, a*0.06, l/37.5, a/18.75);

    fill(150);
    ellipse(l*0.09166, a*0.14, l/37.5, a/18.75);
    ellipse(l*0.15, a*0.14, l/37.5, a/18.75);
    ellipse(l/4.8, a*0.14, l/37.5, a/18.75);
  }

  void countDown() {
    if (!fechado) {
      count++;
      if (count >= 0*60) { //semaforo1
        fill(150);
        ellipse(l*0.09166, a*0.06, l/37.5, a/18.75);
      } 
      if (count >= 1*60) { //semaforo2
        fill(150);
        ellipse(l*0.15, a*0.06, l/37.5, a/18.75);
      }
      if (count >= 2*60) { //semaforo3
        fill(150);
        ellipse(l/4.8, a*0.06, l/37.5, a/18.75);
      }
      if (count >= 3*60) { //liberada a largada
        fill(137, 90, 90);
        ellipse(l*0.09166, a*0.14, l/37.5, a/18.75);
        ellipse(l*0.15, a*0.14, l/37.5, a/18.75);
        ellipse(l/4.8, a*0.14, l/37.5, a/18.75);

        carro1.andar();
      }
    }
  }
}

void ehFechado() {
  if (car1 >= l*0.912 || car2 >= l*0.912 || car3 >= l*0.912) {
    fechado = true;
    over = true;
  }
}

void keyPressed() {
  if (key == ENTER) {
    fechado = false;
  }
}

void resultado() {
  fill(0);
  if (e != 0) {
    text("O carro " + e + " foi escolhido!", l/2, a*0.87);
  } else text("Nenhum carro foi escolhido...", l/2, a*0.87);

  int ganhador = 0;
  if (car1 >= l*0.912) ganhador = 1;
  if (car2 >= l*0.912) ganhador = 2;
  if (car3 >= l*0.912) ganhador = 3;

  if (ganhador != 0) {
    if (ganhador == e) text("Você ganhou", l/2, a*0.93);
    else text("Você perdeu... O carro " + ganhador + " é o vencedor!", l/2, a*0.93);
  }
}

void mousePressed() {
  if (fechado && !over) { 
    if ( mouseX > l/120 && mouseX < l*0.0583 && //carro1
      mouseY < a*0.35 && mouseY > a*0.2833) {
      e = 1;
    } else if ( mouseX > l/120 && mouseX < l*0.0583 && //carro2
      mouseY > a*0.466 && mouseY < a*0.533) {
      e = 2;
    } else if ( mouseX > l/120 && mouseX < l*0.0583 && //carro3
      mouseY > a*0.65 && mouseY < a*0.7166) {
      e = 3;
    } else {
      e = 0;
    }
  } else if (over) over = false;
}

void cenario() {
  fill(190, 20, 97);
  rect(l/2, a/10, l, a/5); //ceu
  fill(62, 52, 87);
  rect(l/2, a*0.9, l, a/5); //gramado
  fill(48, 74, 96);
  ellipse(l*0.833, 0, l*0.15, a*0.3);
  fill(62, 52, 65);
  ellipse(l*0.15, a*0.9, l/15, a/7.5);
  fill(149, 56, 69);
  ellipse(l/6, a*0.8933, l/15, a/7.5);
  fill(360);
  rect(l/2, a*0.9, l*0.4, a/6); //display

  //pistas
  fill(0, 64, 84);
  rect(l/2, a*0.31667, l, a/6); //pista1
  rect(l/2, a/2, l, a/6); //pista2
  rect(l/2, a*0.6833333333, l, a/6); //pista3
  fill(360);
  rect(l/12, a/2, l/30, a/1.875); //largada
  rect(l*0.95, a/2, l/30, a/1.875); //chegada
}

void replay() {
  colorMode(RGB, 255, 255, 255);
  fill(255, 255, 255, 1);
  rect(l/2, a/2, l, a);
  colorMode(HSB, 360, 100, 100);
  fill(0);
  text("Clique para jogar novamente", l/2, a/2);
  car1 = l/30;
  car2 = l/30;
  car3 = l/30;
  count = 0;
  e = 0;
}
