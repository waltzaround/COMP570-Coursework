import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import javax.swing.*; 
import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class iGovt extends PApplet {





AudioPlayer song;
Minim minim;//audio context

StringList chatLog;
String typedText = "";
String execute; //for a future feature - implementation TBA
String user; // sets user-set name
String job; // sets user-set occupation
String id; // sets user-set username
String axx = "Citizen";
PFont font; // system font used to make it look like a terminal
PImage img; //launch screen
PImage img1; // game screen
int    bgColor; // background color
//Stats
int nourish = 20; // nourishment stat - lose condition triggered if this reaches 0
int intel = 0; // intelligence stat
int wealth = 20; // wealth stat - lose condition triggered if this reaches 0
//End Stats

//timer section
int savedTime; // timer for day-nourishment counter
int totalTime = 7000; // 7 second delay for day-nourishment counter
int savedWorkTime;// timer for tax counter
int totalWorkTime = 15000; // 15 second delay for tax counter

//Story Progression Section
boolean menuState = true; // has splash screen been clicked?
boolean menuState1 = false; // splash screen has been triggered
boolean partyMember = false; // is user a party member yet?
boolean partyOfficial = false; // is user a party official yet?
boolean sysAdmin = false; // is user a system administrator yet?
boolean statsOff = true; // has user clicked splash screen yet? true if no
boolean StatsOn = false;// if true user has clicked spalash screen and stat counter begins ticking

//chatLog section

int chatLogMax = 26; //OVER 90000 loljk set something later



public void setup() {
  size(800, 600);
  frameRate(60);
  img = loadImage("1.jpg");
  img1 = loadImage("2.jpg");
  font = loadFont("Munro-18.vlw");
  minim = new Minim(this);
  song = minim.loadFile("sound1.mp3", 1280);

  //start timer
  savedTime = millis();
  savedWorkTime = millis();
  //

  //begin arraylist for command history
  chatLog = new StringList();
  //end arraylist for command history

  // ask for the name
  user = JOptionPane.showInputDialog(
  null, 
  "Welcome to iGovt. Enter your name.", 
  "iGovt Setup", 
  JOptionPane.QUESTION_MESSAGE);

  // ask for the Govt ID
  id = JOptionPane.showInputDialog(
  null, 
  "Create an iGovt Username. Non-compliance is punishable by death.", 
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
  //begin start dialogue
  chatLog.append("Hello " + user );
  chatLog.append("Welcome to your involuntary iGovt Terminal. You will spend the rest of your life here.");

  chatLog.append("");
  chatLog.append("Available Commands:");
  chatLog.append("eat, work, read, read government, eat bacon");
  chatLog.append("vote, vote national, vote labour");
  chatLog.append("sudo, shutdown, riot, dissent");
  chatLog.append("hack, root, rm rf");
  chatLog.append("");
  chatLog.append("Remember to type eat and work. The regime frowns the poor and hungry.");
  //end start dialogue
//milestone activator
if (nourish >= 50 && intel >= 50 && wealth >= 50) {
  axx = "Party Member";
  partyMember = true;
}

//milestone1 activator
if (nourish >= 100 && intel >= 100 && wealth >= 100) {
  axx = "Party Official";
    chatLog.append("Your Superiors have noticed your achievements.");
  chatLog.append("You have been promoted to the rank of iGovt Party Official."); 
    partyOfficial = true;
}

//milestone2 activator
if (nourish >= 150 && intel >= 150 && wealth >= 150) {
  axx = "System Administrator";
      sysAdmin = true;
}
}



public void draw() {
  background(bgColor);
  bgColor++;


  //begin Game start screen segment
  if (menuState == true) {
    image(img, 0, 0);
  }
  if (menuState1 == true) {
    image(img1, 0, 0);
  }
  //end Game start screen segment

  //Begin chat history segment
  if (chatLog.size() > chatLogMax) {
    chatLog.remove(0);
  }
  //End chat history segment



  //begin text input segment
  textFont(font, 18);
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : " "), 35, 580);

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
    //Stats section
    text("Vital Statistics:", 616, 105);
    text(nourish, 730, 120);
    text("Nourishment:", 630, 120);
    text(intel, 730, 135);
    text("Intelligence:", 640, 135);
    text(wealth, 730, 150);
    text("Wealth:", 676, 150);


    //begin chatLog section
    for (int i=0; i < chatLog.size(); i++) {
      text(chatLog.get(i), 25, 565+(i*15)-(chatLog.size()*15));
    }
    //      text(chatLog.get(27), 25, 160); // continue syntax
    //      text(chatLog.get(26), 25, 175);
    //      text(chatLog.get(25), 25, 190);
    //      text(chatLog.get(24), 25, 205);
    //      text(chatLog.get(23), 25, 220);
    //      text(chatLog.get(22), 25, 235);
    //      text(chatLog.get(21), 25, 250);
    //      text(chatLog.get(20), 25, 265);
    //      text(chatLog.get(19), 25, 280);
    //      text(chatLog.get(18), 25, 295);
    //      text(chatLog.get(17), 25, 310);
    //      text(chatLog.get(16), 25, 325);
    //      text(chatLog.get(15), 25, 340);
    //      text(chatLog.get(14), 25, 355);
    //      text(chatLog.get(13), 25, 370);
    //      text(chatLog.get(12), 25, 385);
    //      text(chatLog.get(11), 25, 400);
    //      text(chatLog.get(10), 25, 415);
    //      text(chatLog.get(9), 25, 430);
    //      text(chatLog.get(8), 25, 445);
    //      text(chatLog.get(7), 25, 460);
    //      text(chatLog.get(6), 25, 475);
    //      text(chatLog.get(5), 25, 490);
    //      text(chatLog.get(4), 25, 505);
    //      text(chatLog.get(3), 25, 520);
    //      text(chatLog.get(2), 25, 535);
    //      text(chatLog.get(1), 25, 550);
    //      text(chatLog.get(0), 25, 565);
    //end chatLog section
  }

  //end status segment
  //
  //Story Progression Segment

  ////Eat function
  int latestChat = chatLog.size()-1;
  if  (chatLog.size()!=0 ) {
    if (chatLog.get(latestChat).length() >= 3 && chatLog.get(latestChat).substring(0, 3).equals("eat")) {
      if ( chatLog.get(latestChat).length() <= 3) { 
        chatLog.append("You eat your Government-Issued Soylent. You are still hungry.");
        chatLog.append("+1 Nourishment");      
        nourish ++;
      }
      else {
        nourish ++;
        chatLog.append("You eat your Government-Endorsed " + (chatLog.get(latestChat).substring(4, chatLog.get(latestChat).length())));
        chatLog.append("+1 Nourishment");
      }
    }
  }
  //end eat function

  //begin work function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("work")) {
    chatLog.append("You mindlessly hammer away at your iGovt keyboard to earn a living.");
    chatLog.append("+1 Wealth");
    wealth ++;
  }
  //end work function

  ////Read function
  if  (chatLog.size()!=0 ) {
    if (chatLog.get(latestChat).length() >= 4 && chatLog.get(latestChat).substring(0, 4).equals("read")) {
      if ( chatLog.get(latestChat).length() <= 4) { 
        chatLog.append("You read about Pop Culture in your Citizen's Manual. You feel stupider.");
        chatLog.append("-1 Intelligence");      
        intel --;
      }
else {
  intel ++;
  chatLog.append("You read about" + (chatLog.get(latestChat).substring(4, chatLog.get(latestChat).length())) + " in your Government-Endorsed literature." );
  chatLog.append("+1 Intelligence");
}
}
}
//end eat function

////Begin TEMPLATE function
//if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("vote national")) {
//  chatLog.append("Glorious Leader John Key motivates you to get a Vasectomy.");
//  chatLog.append("-1 Self Respect");
//  chatLog.append("-1 Intelligence");
//  intel --;
//}
//  chatLog.append("sudo, shutdown, riot, dissent");
//chatLog.append("hack, root, rm rf, make");
////end TEMPLATE function





//Begin sleep function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("sleep")) {
  chatLog.append("Sleeping is frowned upon by the regime.");
  chatLog.append("-2 Wealth");
  wealth --;
  wealth --;
}
//end sleep function

//Begin dissent function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("dissent")) {
  chatLog.append("you try to start a moral crusade against the regime, but stupid people take over the campaign and it ultimately fails.");
  chatLog.append("-2 Wealth");
  wealth --;
  wealth --;
}
//end dissent function

//Begin root function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("root")) {
  chatLog.append("Unrecognized Command.");
  chatLog.append("Fine Applied.");
  chatLog.append("-2 Wealth");
  wealth --;
  wealth --;
}
//end root function


//Begin riot function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("riot")) {
  chatLog.append("You try to raid your local party office with a group of disgruntled citizens.");
  chatLog.append("You are fined and jailed for dissent.");
  chatLog.append("-2 Wealth");
  chatLog.append("-5 Nourishment");
  wealth --;
  wealth --;
  nourish --;
  nourish --;
  nourish --;
  nourish --;
  nourish --;
}
//end sudo function

//Begin shutdown function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("shutdown")) {
  String shutdownCmd = "shutdown -s";
  try {
    Process child = Runtime.getRuntime().exec(shutdownCmd);
  } 
  catch (IOException e)
  { // ignore
  }
}
//end shutdown function

//Begin rm rf function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("rm rf")) {
  chatLog.append("System Error.");
  wealth = 10;
  nourish = 10;
  intel = 10;
}
//end rm rf function

//Begin hack function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("hack")) {
  chatLog.append("Dissent will not be tolerated.");
  chatLog.append("Fine Applied.");
  chatLog.append("-1 Wealth");
  wealth --;
}
//end hack function

//Begin sudo function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("sudo")) {
  chatLog.append("Command disabled by Administrator.");
  chatLog.append("Fine Applied.");
  chatLog.append("-1 Wealth");
  wealth --;
}
//end sudo function

//Begin vote function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("vote")) {
  chatLog.append("You are beaten, fined and jailed for expressing your desire for democracy.");
  chatLog.append("Be a good citizen and enjoy some free music courtesy of One Direction!");
  chatLog.append("-1 Wealth");
  chatLog.append("-1 Intelligence");
  chatLog.append("-5 Nourishment");
  wealth --;
  intel --;
  nourish --;
  nourish --;
  nourish --;
  nourish --;
  nourish --;
}
//end vote function

//Begin helen function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("vote labour")) {
  chatLog.append("Your soul is devoured by Helen Clark. Her party also robs you.");
  chatLog.append("-1 Wealth");
  chatLog.append("-1 Soul");
  wealth --;
}
//end helen function
//Begin john function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("vote national")) {
  chatLog.append("Glorious Leader John Key motivates you to get a Vasectomy.");
  chatLog.append("-1 Self Respect");
  chatLog.append("-1 Intelligence");
  intel --;
}
//end john function

//begin dragon function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("mother of dragons")) {
  chatLog.append("WHERE ARE MY DRAGONS? WHERE ARE MY DRAGONS?");
  chatLog.append("EH SRSLY. DAFUQ ARE MY DRAGENZ?!?!?");
}
//end dragon function

//begin drogo function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("drogo")) {
  chatLog.append("Crown for king.");
  chatLog.append("+5 Wealth");
  chatLog.append("-5 Nourishment");
  -- nourish;
  -- nourish;
  -- nourish;
  -- nourish;
  -- nourish;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  -- intel;
}
//end drogo function

//Begin sex function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("sex")) {
  chatLog.append("Sex is frowned upon by the regime.");
    chatLog.append("Penalty Applied.");
  chatLog.append("-2 Wealth");
  wealth --;
  wealth --;
}
//end sex function

//Begin "have sex" function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("have sex")) {
  chatLog.append("Sex is frowned upon by the regime.");
    chatLog.append("Penalty Applied.");
  chatLog.append("-2 Wealth");
  wealth --;
  wealth --;
}
//end "have sex" function\

//begin allah hu ackbar

if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("allah hu ackbar")) {
 ++ nourish;
  ++ nourish;
  ++ nourish;
  ++ nourish;
  ++ nourish;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ intel;
  ++ intel;
  ++ intel;
  ++ intel;
  ++ intel;
  //
  ++ nourish;
  ++ nourish;
  ++ nourish;
  ++ nourish;
  ++ nourish;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ intel;
  ++ intel;
  ++ intel;
  ++ intel;
  ++ intel;
  //
  ++ nourish;
  ++ nourish;
  ++ nourish;
  ++ nourish;
  ++ nourish;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ wealth;
  ++ intel;
  ++ intel;
  ++ intel;
  ++ intel;
  ++ intel;
}
//end allah hu ackbar


//begin help function
if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("help")) {
  chatLog.append("Available Commands:");
  chatLog.append("eat, work, read, read government, eat bacon");
  chatLog.append("vote, vote national, vote labour");
  chatLog.append("sudo, shutdown, riot, dissent");
  chatLog.append("hack, root, rm rf");
  //end help function
}

if (nourish <= 0) {
  JOptionPane.showMessageDialog(
  null, 
  "You have been killed by starvation. Have a nice day.", 
  "iGovt Compliance", 
  JOptionPane.WARNING_MESSAGE); 
  exit();
}

if (wealth <= 0) {
  JOptionPane.showMessageDialog(
  null, 
  "You are bankrupt. iGovt will now involuntarily evict you. Have a nice day.", 
  "iGovt Compliance", 
  JOptionPane.WARNING_MESSAGE); 
  exit();
}


////milestone activator
//if (nourish >= 50 && intel >= 50 && wealth >= 50) {
//  axx = "Party Member";
//  partyMember = true;
//}
//
////milestone1 activator
//if (nourish >= 100 && intel >= 100 && wealth >= 100) {
//  axx = "Party Official";
//    chatLog.append("Your Superiors have noticed your achievements.");
//  chatLog.append("You have been promoted to the rank of iGovt Party Official."); 
//    partyOfficial = true;
//}
//
////milestone2 activator
//if (nourish >= 150 && intel >= 150 && wealth >= 150) {
//  axx = "System Administrator";
//      sysAdmin = true;
//}
//

//Begin shutdown function
if ( intel >= 50 ) {
 JOptionPane.showMessageDialog(
  null, 
  "You have been deemed too intelligent. You will soon be purged. Have a nice day.", 
  "iGovt Compliance", 
  JOptionPane.WARNING_MESSAGE);   
String shutdownCmd = "shutdown -s";
try {
Process child = Runtime.getRuntime().exec(shutdownCmd);
} catch (IOException e)
{ // ignore
}
}
//end shutdown function
// begin hunger timer

// Calculate how much time has passed
int passedTime = millis() - savedTime;
// Has five seconds passed?
if (passedTime > totalTime) {
  nourish --;
    chatLog.append("A day has passed.");
        chatLog.append(" -1 Nourishment");
  savedTime = millis(); // Save the current time to restart the timer!
}

//end hunger timer
//begin tax timer
// Calculate how much time has passed
int passedWorkTime = millis() - savedWorkTime;
// Has five seconds passed?
if (passedWorkTime > totalWorkTime) {
  savedWorkTime = millis(); // Save the current time to restart the timer!
  wealth --;
      chatLog.append("Your Government demands taxes.");
          chatLog.append(" -1 Wealth.");
}

  //begin swear filter draft 
  //fuck
  if ( chatLog.size()!=0 && chatLog.get(chatLog.size() -1).equals("fuck")) {
    JOptionPane.showMessageDialog(
    null, 
    "You have violated the Terms of Use. Please remain at your current location. Do not attempt to flee. Officials shall escort you to the nearest compliance facility shortly.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE); 
    exit();
  }
  //shit
  if ( chatLog.size()!=0 && chatLog.get(chatLog.size() -1).equals("shit")) {
    JOptionPane.showMessageDialog(
    null, 
    "You have violated the Terms of Use. Please remain at your current location. Do not attempt to flee. Friendly compliance officials shall escort you to the nearest assimilation facility shortly.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE); 
    exit();
  }

  //cunt
  if ( chatLog.size()!=0 && chatLog.get(chatLog.size() -1).equals("cunt")) {
    JOptionPane.showMessageDialog(
    null, 
    "You have violated the Terms of Use. Please remain at your current location. Do not attempt to flee. Friendly compliance officials shall escort you to the nearest assimilation facility shortly.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE); 
    exit();
  }
    //dick
    if ( chatLog.size()!=0 && chatLog.get(chatLog.size() -1).equals("dick")) {
      JOptionPane.showMessageDialog(
      null, 
      "You have violated the Terms of Use. Please remain at your current location. Do not attempt to flee. Friendly compliance officials shall escort you to the nearest assimilation facility shortly.", 
      "iGovt Compliance", 
      JOptionPane.WARNING_MESSAGE); 
      exit();
    }
    //end swear filter


}

public void mousePressed() {
  menuState = false; 
  if (menuState == false) {
    menuState1 = true;
  }
}


//Begin command line segment
public void keyReleased() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0, max(0, typedText.length()-1));
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
      chatLog.append(typedText);
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

public void keyPressed() {
  if (key == ESC) {
            chatLog.append("iGovt IDS");
        chatLog.append("Escape Attempt Thwarted.");
    key = 0;  // Fools! don't let them escape!
  }
}




public void stop() {
  super.stop();
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "iGovt" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
