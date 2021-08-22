//variaveis globais
int l, a; //largura e altura
int car1, car2, car3; //posições x dos carros 1, 2 e 3
int e; //escolha do jogador
int x1, x2, x3; //variaveis para random
int count; //contador
boolean fechado = true, over = false; //inicio e termino de jogo

void setup() {
  size(900, 450);
  rectMode(CENTER);
  l = width;
  a = height;
  noStroke();
  colorMode(HSB, 360, 100, 100);
  background(360);
  textAlign(CENTER); //alinhamento central do texto
  textSize(height/25);
  car1 = l/30 ; //posição inicial dos carros
  car2 = l/30; 
  car3 = l/30;
}

void draw() {
  if (!over) {
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

    //semáforos
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

    //pistas
    //fill(29, 65, 95);
    fill(0, 64, 84);
    rect(l/2, a*0.31667, l, a/6); //pista1
    rect(l/2, a/2, l, a/6); //pista2
    rect(l/2, a*0.6833333333, l, a/6); //pista3
    fill(360);
    rect(l/12, a/2, l/30, a/1.875); //largada
    rect(l*0.95, a/2, l/30, a/1.875); //chegada

    //carros
    fill(359, 43, 100); //rosa
    rect(car1, a*0.31667, l/20, a/15); //carro1
    fill(203, 43, 95); //ciano
    rect(car2, a/2, l/20, a/15); //carro2
    fill(59, 43, 95); //amarelo
    rect(car3, a*0.6833333333, l/20, a/15); //carro3

    fill(0);
    text(1, car1, a/3); //texto carro1
    text(2, car2, a*0.5166666667); //texto carro2
    text(3, car3, a*0.7); // texto carro3


    if (keyPressed) { //inicia corrida
      if (key == ENTER) {
        fechado = false;
      }
    }

    if (car1 >= l*0.912 || car2 >= l*0.912 || car3 >= l*0.912) { //carros na linha de chegada
      fechado = true;
      over = true;
    }

    x1 = int (random(0, 5));
    x2 = int (random(0, 5));
    x3 = int (random(0, 5));

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

        car1 = car1 + x1; //velocidade carro1
        car2 = car2 + x2; //velocidade carro2
        car3 = car3 + x3; //velocidade carro3
      }
    }

    //hit box
    if (mousePressed) {
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
          e = 4;
        }
      }
    }

    //escolha do jogador
    fill(0);
    if (e == 1) {
      text("O carro 1 foi escolhido", l/2, a*0.86);
    } else if (e == 2) {
      text("O carro 2 foi escolhido", l/2, a*0.86);
    } else if (e == 3) {
      text("O carro 3 foi escolhido", l/2, a*0.86);
    }

    //resultados
    if (e == 1 && car1 >= l*0.912) { //carro1 ganha
      text("Você ganhou!", l/2, a*0.93);
    } else if (e == 2 && car1 >= l*0.912 || e == 3 && car1 >= l*0.912) { //carro1 ganha, carro2 e 3 perdem
      text("Você perdeu! O carro 1 é o ganhador", l/2, a*0.93);
    } else if (e == 2 && car2 >= l*0.912) { //carro2 ganha
      text("Você ganhou!", l/2, a*0.93);
    } else if (e == 1 && car2 >= l*0.912 || e == 3 && car2 >= l*0.912) { //carro2 ganha, carro1 e 3 perdem
      text("Você perdeu! O carro 2 é o ganhador", l/2, a*0.93);
    } else if (e == 3 && car3 >= l*0.912) { //carro3 ganha
      text("Você ganhou!", l/2, a*0.93);
    } else if (e == 1 && car3 >= l*0.912 || e == 2 && car3 >= l*0.912) { //carro3 ganha, carro1 e 2 perdem
      text("Você perdeu! O carro 3 é o ganhador", l/2, a*0.93);
    } else if (e == 4 && (car1 >= l*0.912 || car2 >= l*0.912 || car3 >= l*0.912)
      && car1 >= l*0.912) { //nenhum carro selecionado, carro 1 ganha
      text("Nenhum carro selecionado", l/2, a*0.86);
      text("Você perdeu! O carro 1 é o ganhador", l/2, a*0.93);
    } else if (e == 4 && (car1 >= l*0.912 || car2 >= l*0.912 || car3 >= l*0.912)
      && car2 >= l*0.912) { //nenhum carro selecionado, carro 2 ganha
      text("Nenhum carro selecionado", l/2, a*0.86);
      text("Você perdeu! O carro 2 é o ganhador", l/2, a*0.93);
    } else if (e == 4 && (car1 >= l*0.912 || car2 >= l*0.912 || car3 >= l*0.912)
      && car3 >= l*0.912) { //nenhum carro selecionado, carro 3 ganha
      text("Nenhum carro selecionado", l/2, a*0.86);
      text("Você perdeu! O carro 3 é o ganhador", l/2, a*0.93);
    }
  } else { //replay
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
    e = 4;
  }
}

void mousePressed() {
  if (over) {
    over = false;
  }
}
