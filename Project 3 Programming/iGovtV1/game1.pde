import javax.swing.*;
import ddf.minim.*;

AudioPlayer song;
Minim minim;//audio context


String typedText = "";
String execute = "";
String user;
String job;
String id;
String axx = "Citizen";
PFont font;
PImage img;
PImage img1;
int    bgColor;
boolean menuState = true;
boolean menuState1 = false;

void setup() {
  size(800, 600);
  frameRate(60);
  img = loadImage("1.jpg");
  img1 = loadImage("2.jpg");
  font = loadFont("Munro-18.vlw");
  minim = new Minim(this);
  song = minim.loadFile("sound1.mp3", 1280);

  // ask for the name
  user = JOptionPane.showInputDialog(
  null, 
  "Welcome to iGovt. Enter your name.", 
  "iGovt Setup", 
  JOptionPane.QUESTION_MESSAGE);

  // ask for the Govt ID
  id = JOptionPane.showInputDialog(
  null, 
  "Enter Your iGovt ID. Non-compliance is punishable by death.", 
  "iGovt Setup", 
  JOptionPane.QUESTION_MESSAGE);

  // ask for the username
  job = JOptionPane.showInputDialog(
  null, 
  "Enter Your Occupation. Non-compliance is punishable by death", 
  "iGovt Setup", 
  JOptionPane.QUESTION_MESSAGE);

  // check if the user wants to run the program  
  int choice = JOptionPane.showConfirmDialog(
  null, 
  "Do you accept the Terms and Conditions of the iGovernment OS?", 
  "iGovt Setup", 
  JOptionPane.YES_NO_OPTION);
  if ( choice != JOptionPane.YES_OPTION )
  {
    // user doesn't want to run program: message and exit
    JOptionPane.showMessageDialog(
    null, 
    "Please remain at your current location. Do not attempt to flee. Friendly compliance officials shall escort you to the nearest assimilation facility shortly.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE);
    exit();
  }
}


void draw() {
  background(bgColor);
  bgColor++;

  //begin Game progression segment

  if (menuState == true) {
    image(img, 0, 0);
  }
  if (menuState1 == true) {
    image(img1, 0, 0);
  }

  //end Game progression segment

  //begin text input segment

  textFont(font, 18);
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : " "), 25, 580);

  //end text input segment

  //begin status segment

  if (menuState1 == true) {
    text("Network Connection: Active", 25, 30);  
    text("People's Firewall: Active", 25, 45);  
    text(user, 65, 60);
    text("User:", 25, 60);
    text("Occupation:", 25, 75);
    text(job, 110, 75);
    text("Access Level:", 25, 90);
    text(axx, 125, 90);
    text("Govt ID:", 25, 105);
    text(id, 85, 105);
    //begin log section
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 160);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 175);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 190);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 205);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 220);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 235);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 250);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 265);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 280);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 295);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 310);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 325);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 340);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 355);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 370);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 385);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 400);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 415);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 430);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 445);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 460);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 475);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 490);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 505);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 520);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 535);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 550);
    text("TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", 25, 565);
    //end log section
  }

  //end status segment
}

void mousePressed() {
  menuState = false; 
  if (menuState == false) {
    menuState1 = true;
  }
}


//Begin command line segment
void keyReleased() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0, max(0, typedText.length()-1));
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
      typedText = execute;
      typedText = "";
      song.play(1);
    case RETURN:
      // comment out the following two lines to disable line-breaks
      //  typedText += "\n";
      //   break;
    case ESC:
    case DELETE:
      break;
    default:
      typedText += key;
    }
  }
  //End command line segment
}
void stop() {
  super.stop();
}

