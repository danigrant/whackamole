class Mole {
  float xPos;
  float yPos;

  PImage[] moles;
  int currentMole;

  //Timer gameTimer;
  //Timer imageTimer;

  //boolean timerStarted = false;

  // how long to stay in this currentMole
  int totalCurrentMoleTime;

  // how long have we been in this currentMole?
  int currentMoleTime;

  //constructor

  Mole(float x, float y) {
    xPos = x;
    yPos = y;

    //start it empty
    currentMole = 0;

    //load the images
    moles = new PImage[9];
    for (int i = 0; i < moles.length; i++) {
      moles[i] = loadImage("mole" + i + ".jpg");
    }

    /*//initialize the timers
     gameTimer = new Timer(30);
     imageTimer = new Timer((int) random(1, 4));*/

    resetTimers();
  }

  void resetTimers()
  {
    // pick a random amount of time to stay in this currentMole
    totalCurrentMoleTime = int(random(50, 600));

    // reset our current counter
    currentMoleTime = 0;
  }

  void update()
  {
    // increase amount of time in our current currentMole
    currentMoleTime++;

    // have we gone over our total currentMole time?
    if (currentMoleTime >= totalCurrentMoleTime)
    {
      // switch!
      if (currentMole == 0) { 
        currentMole = (int) random(0, 9);
      }
      else { 
        currentMole = 0;
      }

      // reset timers
      resetTimers();
    }
  }


  void display() {
    image(moles[currentMole], xPos, yPos);
  } 



  //hits
  void checkHit() {
    //generic
    if (dist(mouseX, mouseY, xPos, yPos) < 70) {
      //if good
      if (currentMole > 0 && currentMole < 7) {
        currentMole = 0;
        score++;
      } 
      //is evil
      else if (currentMole == 7 || currentMole == 8) {
        moleGameOver();
      }
    }
  }


  void moleGameOver() {
    gameOver = true;
  }
}

