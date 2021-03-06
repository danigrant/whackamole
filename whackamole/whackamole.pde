//initializing all the moles
Mole topRight;
Mole topCenter;
Mole topLeft;

Mole midRight;
Mole midCenter;
Mole midLeft;

Mole bottomRight;
Mole bottomCenter;
Mole bottomLeft;

Timer timer;
boolean gameOver;

int score;
int timeLeft;

PFont f;
PImage[] hammer;

void setup() {
  size(550, 550);
  imageMode(CENTER);
  textAlign(CENTER);
  score = 0;

  f = loadFont("Quicksand-Light-48.vlw");
  fill(255);

  //set param in new Timer to amount of seconds you want the game to last
  timer = new Timer(30);
  timer.startTimer();

  hammer = new PImage[2];
  hammer[0] = loadImage("hammer.png");
  hammer[1] = loadImage("hammerdown.png");

  //init Mole objects for each spot and give it coordinates
  topRight = new Mole(90+25, 75);
  topCenter = new Mole(250+25, 75);
  topLeft = new Mole(410+25, 75);

  midRight = new Mole(90+25, 235);
  midCenter = new Mole(250+25, 235);
  midLeft = new Mole(410+25, 235);

  bottomRight = new Mole(90+25, 395);
  bottomCenter = new Mole(250+25, 395);
  bottomLeft = new Mole(410+25, 395);
}

void draw() {
  if (gameOver == false) {
    background(0);
    noCursor();

    timeLeft = (int) (30 - timer.passedTime);
    displayMoles();
    displayTimeScore();
    checkTimerOver();
    displayHammer();
  } 
  else { //gameOver is true
    drawReplayOption();
    checkReplayHit();
  }
}

void displayMoles() {
  topRight.display();
  topCenter.display();
  topLeft.display();

  midRight.display();
  midCenter.display();
  midLeft.display();

  bottomRight.display();
  bottomCenter.display();
  bottomLeft.display();

  topRight.update();
  topCenter.update();
  topLeft.update();

  midRight.update();
  midCenter.update();
  midLeft.update();

  bottomRight.update();
  bottomCenter.update();
  bottomLeft.update();
}

void checkTimerOver() {
  if (timer.isFinished()) {
    midRight.moleGameOver();
  }
}

void displayHammer() {
  if (mousePressed) {
    image(hammer[1], mouseX, mouseY);
  }
  else {
    image(hammer[0], mouseX, mouseY);
  }
}

void drawReplayOption() {
  background(0);
  cursor();
  textFont(f, 48);
  text("Game Over\nScore = " + score, width/2, height/2 - 50);

  //draw replay button
  rectMode(CENTER);
  fill(255);
  rect(width/2, height-150, 150, 50);
  fill(0);
  textFont(f, 30);
  text("replay", width/2, height-140);
  fill(255);
}

void checkReplayHit() {
  //if click on replay
  if (mouseX > (width/2 - 75) &&  mouseX < (width/2 + 75) && mouseY < height-150 + 25 && mouseY > height-150 - 25) {
    fill(0);
    rect(width/2, height-150, 150, 50);
    fill(255);
    textFont(f, 30);
    text("replay", width/2, height-140);
    if (mousePressed) {
      reset();
    }
  }
}

void mousePressed() {
  topRight.checkHit();
  topCenter.checkHit();
  topLeft.checkHit();

  midRight.checkHit();
  midCenter.checkHit();
  midLeft.checkHit();

  bottomRight.checkHit();
  bottomCenter.checkHit();
  bottomLeft.checkHit();
}

void displayTimeScore() {
  textFont(f, 30);
  text("Time: " + timeLeft + " Score: " + score + "\nGoal: Don't Hit X", width/2, height - 50);
}

void reset() {
  score = 0;
  timer.totalTime = 30;
  timer.startTimer();

  topRight.currentMole = 0;
  topCenter.currentMole = 0;
  topLeft.currentMole = 0;

  midRight.currentMole = 0;
  midCenter.currentMole = 0;
  midLeft.currentMole = 0;

  bottomRight.currentMole = 0;
  bottomCenter.currentMole = 0;
  bottomLeft.currentMole = 0;

  gameOver = false;
}

