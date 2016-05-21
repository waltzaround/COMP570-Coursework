
/**
 * Main PDE File - You need this to run everything!
 * @Author Walter Lim
 * This game was developed to run as a text RPG.
 * The game was built to mimic an old DOS terminal. 
 * It parodies software that an authoritarian regime would use to control it's citizens.
 * Warning! it will shut down any devices running Windows as an OS if certain conditions are triggered.
 */
import java.io.IOException;// For shutdown code

import javax.swing.JOptionPane;// for java dialog boxes

import ddf.minim.AudioPlayer;// for audio player in the standalone app
import ddf.minim.Minim;// for audio player
import processing.core.PApplet;// for the standalone app - redundant here
import processing.core.PFont;// for the standalone app - redundant here
import processing.core.PImage;// for the standalone app - redundant here
import processing.data.StringList;// for the standalone app - redundant here


/**
 * Comments TBC
 */
/**
 * 
 */
private static final long serialVersionUID = 1337;// VersionUID
AudioPlayer song;// for sound file
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
int nourish = 20; // nourishment stat - lose condition triggered if this reaches 0 | win condition triggered if this hits 100
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
boolean statsOff = true; // has user clicked splash screen yet? true if no
boolean StatsOn = false;// if true user has clicked spalash screen and stat counter begins ticking
boolean fullScreenEnabled = false; // full screen disabled
//chatLog section

int chatLogMax = 26; //limit for number of text strings in text history

/**
 * Void Setup Section
 * Prepares the game for launch - asks for player name, username, occupation.
 * Requires several prerequisites for launch: Menuscreen JPG files, font file and Sound file.
 */

public void setup() {
  size(800, 600); // sets program size to 800 x 600
  if (frame != null) {
    frame.setResizable(true);//makes frame resizable... Feature WIP
  }
  frameRate(60);// sets framerate to 60 FPS
  img = loadImage("1.jpg");// alias for start splash screen before moused is pressed
  img1 = loadImage("2.jpg");// alias for main game screen
  font = loadFont("Munro-18.vlw");// loads terminal-style font
  minim = new Minim(this);// prerequisite for sound
  song = minim.loadFile("sound1.mp3", 1280);// loads sound that plays every time enter is triggered

  //start timer
  savedTime = millis();// trigger for hunger counter
  savedWorkTime = millis(); // trigger for work counter
  //
  //Timer code attributed to http://www.learningprocessing.com/examples/chapter-10/example-10-4/

  //begin arraylist for command history
  /** typedinput taken from http://wiki.processing.org/index.php/Typed_input
   @author Tom Carden
   */
  chatLog = new StringList();// generates new stringlist for chat history component
  //end arraylist for command history



  // ask for the name - code attributed to https://autonline.aut.ac.nz/bbcswebdav/pid-2918878-dt-content-rid-5312960_4/institution/Papers/175003/Publish/Lecture%2007.pdf
  user = JOptionPane.showInputDialog(
  null, 
  "Welcome to iGovt. Enter your name.", 
  "iGovt Setup", 
  JOptionPane.QUESTION_MESSAGE);// Takes name and places it into user string for use in game

  // ask for the Govt ID
  id = JOptionPane.showInputDialog(
  null, 
  "Create an iGovt Username. Non-compliance is punishable by death.", 
  "iGovt Setup", 
  JOptionPane.QUESTION_MESSAGE);// Takes username and places it into id string for use in game

  // ask for the username
  job = JOptionPane.showInputDialog(
  null, 
  "Enter Your Occupation. Non-compliance is punishable by death", 
  "iGovt Setup", 
  JOptionPane.QUESTION_MESSAGE);// Takes occupation and places it into job string for use in game

  // check if the user wants to run the program  
  int choice = JOptionPane.showConfirmDialog(
  null, 
  "Do you accept the Terms and Conditions of the iGovernment OS?", 
  "iGovt Setup", 
  JOptionPane.YES_NO_OPTION);// Troll function as the T&C makes you an indentured servant to the game... On paper. Seriously though, selecting NO will boot you out of the game whereas selecting YES launches splash screen.
  if ( choice != JOptionPane.YES_OPTION )
  {
    // user doesn't want to run program: message and exit
    JOptionPane.showMessageDialog(
    null, 
    "Please remain at your current location. Do not attempt to flee. Friendly compliance officials shall escort you to the nearest assimilation facility shortly.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE);//message before player is ejected from game
    exit();
  }
  //begin start dialogue
  chatLog.append("Hello " + user );// game specifies your name on the chatlog when game begins
  chatLog.append("Welcome to your involuntary iGovt Terminal. You will spend the rest of your life here.");

  chatLog.append("Type help if you are ever stuck.");
  chatLog.append("Available Commands:");
  chatLog.append("help, eat, drink, work, read, read government, eat bacon, drink vodka");
  chatLog.append("spam, vote, vote national, vote labour");
  chatLog.append("sudo, shutdown, riot, dissent");
  chatLog.append("hack, root, rm rf, blue pill");
  chatLog.append("");
  chatLog.append("Remember to type help. The regime frowns the poor and hungry.");
  //end start dialogue
}

public void draw() {
  background(bgColor);// sets background color
  bgColor++;


  //begin Game start screen segment
  if (menuState == true) {// splash screen active & game screen inactive
    image(img, 0, 0);
  }
  if (menuState1 == true) {// game screen active & game begins
    image(img1, 0, 0);
  }
  //end Game start screen segment

  //Begin chat history segment
  if (chatLog.size() > chatLogMax) {
    chatLog.remove(0);// purges oldest message in the stringlist when stringlist is full
  }
  //End chat history segment



  //begin text input segment

  /** typedinput taken from http://wiki.processing.org/index.php/Typed_input
   @author Tom Carden
   */
  textFont(font, 18);// sets Munro Font to size 18
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : " "), 35, 580);

  //end text input segment

  //begin status segment

  if (menuState1 == true) {
    text("Network Connection: Active", 25, 30);  // aesthetic text
    text("People's Firewall: Active", 25, 45);   // aesthetic text
    text(user, 65, 60);// Name that was entered into dialog box
    text("User:", 25, 60);// aesthetic text
    text("Occupation:", 25, 75);// aesthetic text
    text(job, 110, 75);// job that was entered into dialog box
    text("Access Level:", 25, 90);// aesthetic text
    text(axx, 125, 90);// unused function... Original plan was to have this feature switch as player gained stats
    text("Govt ID:", 25, 105);// aesthetic text
    text(id, 85, 105);// occupation that was entered
    //Stats section
    text("Vital Statistics:", 616, 105);// aesthetic text
    text(nourish, 730, 120);// food stat for player. if food = 0 then game ends and WinPC shuts down
    text("Nourishment:", 630, 120);// aesthetic text
    text(intel, 730, 135);// Intelligence stat for player. if intelligence > 50 then game ends and winPC shuts down
    text("Intelligence:", 640, 135);// aesthetic text
    text(wealth, 730, 150);// Wealth stat for player
    text("Wealth:", 676, 150);// aesthetic text


    //begin chatLog section
    /** typedinput taken from http://wiki.processing.org/index.php/Typed_input
     @author Tom Carden
     */
    for (int i=0; i < chatLog.size(); i++) {
      text(chatLog.get(i), 25, 565+(i*15)-(chatLog.size()*15)); // chat history spacing
    }
    //      text(chatLog.get(27), 25, 160); // old code... Useless now
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
  int latestChat = chatLog.size()-1; // latest typed string
  if  (chatLog.size()!=0 ) { // is entered text not 0?
    if (chatLog.get(latestChat).length() >= 3 && chatLog.get(latestChat).substring(0, 3).equals("eat")) {// is latest chat greater than 3 characters and are the first three characters eat? if yes then proceed
      if ( chatLog.get(latestChat).length() <= 3) { // is the latest chat lesser than or equal to three characters?
        chatLog.append("You eat your Government-Issued Soylent. You still feel hungry.");// dialogue
        chatLog.append("+1 Nourishment");      // dialogue
        nourish ++;// +1 nourishment stat
      }
      else {
        nourish ++;// +1 nourishment stat
        chatLog.append("You eat your Government-Endorsed " + (chatLog.get(latestChat).substring(4, chatLog.get(latestChat).length()))); // substitutes the standard dialogue with whatever you entered by extracting everything after the first 4 characters entered to extract your item...
        chatLog.append("+1 Nourishment"); // dialogue
      }
    }
  }
  //end eat function

  ////Drink function
  if  (chatLog.size()!=0 ) {
    if (chatLog.get(latestChat).length() >= 5 && chatLog.get(latestChat).substring(0, 5).equals("drink")) { // is latest chat greater than 5 characters and are the first five characters drink? if yes then proceed
      if ( chatLog.get(latestChat).length() <= 5) { // is the latest chat lesser than or equal to 5 characters?
        chatLog.append("You drink your Government-Issued Soylent. You still feel thirsty.");// dialogue
        chatLog.append("+1 Nourishment");      // dialogue
        nourish ++;// +1 to nourishment stat
      }
      else {
        nourish ++; // +1 to nourishment stat
        chatLog.append("You drink your Government-Endorsed " + (chatLog.get(latestChat).substring(6, chatLog.get(latestChat).length())));// special dialogue... substitutes the standard dialogue with whatever you entered by extracting everything after the first 6 characters entered to extract your item..
        chatLog.append("+1 Nourishment");// dialogue
      }
    }
  }
  //end drink function

  //begin work function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("work")) {// detector for work
    chatLog.append("You mindlessly hammer away at your iGovt keyboard to earn a living."); // dialogue 
    chatLog.append("+1 Wealth");// dialogue 
    wealth ++;// +1 wealth stat
  }
  //end work function

  //begin workwork function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("workwork")) {// detector for workwork in chatlog
    chatLog.append("Unrecognized Command. Fine Applied.");//dialogue
    chatLog.append("-1 Wealth");//dialogue
    wealth --;// -1 Wealth Stat
  }
  //end workwork function

  //begin end function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("end")) {// detector for end in chatlog
    chatLog.append("Escape attempt thwarted.");
  }
  //end end function

  //begin exit function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("exit")) {// detector for exit in chatlog
    chatLog.append("Escape Attempt Thwarted.");
  }
  //end exit function

  //begin Hello function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("hello")) {// detector for hello in chatlog
    chatLog.append("Hi!");
  }
  //end Hello function

  //begin Hi function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("hi")) {// detector for hi in chatlog
    chatLog.append("Hello!");
  }
  //end Hi function

  //begin sup g function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("sup")) {// detector for sup in chatlog
    chatLog.append("Sup dawg.");
  }
  //end sup g function

  //begin sup g function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("sup g")) {// detector for sup g in chatlog
    chatLog.append("Sup dawg.");
  }
  //end sup g function

  //begin sup dawg function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("sup dawg")) {// detector for sup dawg in chatlog
    chatLog.append("Sup g.");
  }
  //end sup dawg function

  //begin red pill function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("red pill")) {// detector for red pill in chatlog - a matrix joke
    chatLog.append("The Matrix can't find you.");
  }
  //end redpill function

  //begin Valar morghulis function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("valar morghulis")) {// detector for valar morghulis in chatlog - game of thrones reference
    chatLog.append("Valar Dohaeris");
  }
  //end Valar morghulis function

  //begin Valar Dohaeris function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("valar dohaeris")) {// detector for valar dohaeris in chatlog - game of thrones reference
    chatLog.append("Valar Morghulis");
  }
  //end Valar Dohaeris function

  //begin ping function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("ping")) {// detector for ping in chatlog
    chatLog.append("pong");
  }
  //end ping function

  //begin pong function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("pong")) {// detector for pong in chatlog
    chatLog.append("ping");
  }
  //end pong function

  //begin what function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("what")) {// detector for what in chatlog
    chatLog.append("The question you should be asking is, what are you?");
  }
  //end what function

  //begin who function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("who")) {// detector for who in chatlog
    chatLog.append("The question you should be asking is, who are you?");
  }
  //end who function

  //begin why function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("why")) {// detector for why in chatlog
    chatLog.append("The question you should be asking is, why are you here?");
  }
  //end why function
  //begin how function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("how")) {// detector for how in chatlog
    chatLog.append("The you should be asking is, how did you get here?");
  }
  //end how function

  //begin what is this function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("what is this")) {// detector for what is this in chatlog
    chatLog.append("The question is, what are you?");
  }
  //end what is this function

  //begin what is this function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("what is this?")) {// detector for what is this? in chatlog
    chatLog.append("The question is, what are you?");
  }
  //end what is this function

  //begin what is this function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("What is this?")) {// detector for What is this? in chatlog
    chatLog.append("The question is, what are you?");
  }
  //end what is this function
  /** shutdown code taken from Stefan Marks
   @author Stefan Marks
   */
  //begin blue pill function - matrix joke
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("blue pill")) {// detector for blue pill in chatlog
    chatLog.append("The Matrix has crashed. System Restarting.");//dialogue
    String shutdownCmd = "shutdown -r";// restarts computer
    try {
      Process child = Runtime.getRuntime().exec(shutdownCmd);// executes shutdownCmd function
    } 
    catch (IOException e)// ignores IOexception
    { // ignore
    }
  }
  //end bluepill function

  ////Read function
  if  (chatLog.size()!=0 ) { // is latest chatlog character size not 0?
    if (chatLog.get(latestChat).length() >= 4 && chatLog.get(latestChat).substring(0, 4).equals("read")) {// is latest chat greater than 4 characters and are the first four characters read? if yes then proceed
      if ( chatLog.get(latestChat).length() <= 4) { // is the latest chat smaller than or equal to four? if not skip this
        chatLog.append("You read about Pop Culture in your Citizen's Manual. You feel stupider.");//dialogue
        chatLog.append("-1 Intelligence");      //dialogue
        intel --;// -1 intelligence stat
      }
      else {
        intel ++;// +1 intelligence stat
        chatLog.append("You read about" + (chatLog.get(latestChat).substring(5, chatLog.get(latestChat).length())) + " in your Government-Endorsed literature." );// special dialogue... substitutes the standard dialogue with whatever you entered by extracting everything after the first 5 characters entered to extract your item..
        chatLog.append("+1 Intelligence");//dialogue
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
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("sleep")) {// detector for sleep in chatlog
    chatLog.append("Sleeping is frowned upon by the regime.");
    chatLog.append("Penalty Applied.");
    chatLog.append("-2 Wealth");
    wealth --;
    wealth --;
  }
  //end sleep function

  //Begin dissent function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("dissent")) {// detector for dissent in chatlog
    chatLog.append("you try to start a moral crusade against the regime...");
    chatLog.append("But stupid people take over the campaign and it ultimately fails.");
    chatLog.append("Protesters: We are Anonymoose Swag Legion.");
    chatLog.append("Protesters: Cause like we are many leet hackers and the Government sucks and stuff.");
    chatLog.append("You feel stupider listening to the Protesters");
    chatLog.append("-5 Intelligence");
    intel -= 5;// - 5 intelligence stat
  }
  //end dissent function

  //Begin root function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("root")) {// detector for root in chatlog
    chatLog.append("Unrecognized Command.");
    chatLog.append("Fine Applied.");
    chatLog.append("-2 Wealth");
    wealth --;
    wealth --;
  }
  //end root function


  //Begin riot function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("riot")) {// detector for riot in chatlog
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
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("shutdown")) {// detector for shutdown in chatlog
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
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("rm rf")) {// detector for rm rf in chatlog
    chatLog.append("System Error.");
    wealth = 10;
    nourish = 10;
    intel = 10;
  }
  //end rm rf function

  //Begin hack function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("hack")) {// detector for hack in chatlog
    chatLog.append("Dissent will not be tolerated.");
    chatLog.append("Fine Applied.");
    chatLog.append("-1 Wealth");
    wealth --;
  }
  //end hack function

  //Begin make function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("make")) {// detector for make in chatlog
    chatLog.append("You are incapable of independent thought. You are unable to make anything.");
    chatLog.append("-1 Independent Thought");
  }
  //end make function

  //Begin sudo function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("sudo")) {// detector for sudo in chatlog
    chatLog.append("Command disabled by Administrator.");
    chatLog.append("Fine Applied.");
    chatLog.append("-1 Wealth");
    wealth --;
  }
  //end sudo function

  //Begin vote function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("vote")) {// detector for vote in chatlog
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
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("vote labour")) {// detector for vote labour in chatlog
    chatLog.append("Your soul is devoured by Helen Clark. Her party also robs you.");
    chatLog.append("-1 Wealth");
    chatLog.append("-1 Soul");
    wealth --;
  }
  //end helen function
  //Begin john function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("vote national")) {// detector for vote national in chatlog
    chatLog.append("Glorious Leader John Key motivates you to get a Vasectomy.");
    chatLog.append("-1 Self Respect");
    chatLog.append("-1 Intelligence");
    intel --;
  }
  //end john function

  //begin dragon function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("mother of dragons")) {// detector for mother of dragons in chatlog - game of thrones reference
    chatLog.append("WHERE ARE MY DRAGONS? WHERE ARE MY DRAGONS?");
    chatLog.append("EH SRSLY. DAFUQ ARE MY DRAGENZ?!?!?");
  }
  //end dragon function

  //begin drogo function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("drogo")) {// detector for drogo in chatlog - game of thrones reference
    chatLog.append("Crown for king.");
    chatLog.append("+5 Wealth");
    chatLog.append("-5 Nourishment");
    nourish += 5;
    wealth += 5;
    intel --;
  }
  //end drogo function

  //Begin sex function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("sex")) {// detector for sex in chatlog
    chatLog.append("Sex is frowned upon by the regime.");
    chatLog.append("Penalty Applied.");
    chatLog.append("-2 Wealth");
    wealth --;
    wealth --;
  }
  //end sex function

  //Begin intercourse function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("intercourse")) {// detector for intercourse in chatlog
    chatLog.append("Sex is frowned upon by the regime.");
    chatLog.append("Penalty Applied.");
    chatLog.append("-2 Wealth");
    wealth --;
    wealth --;
  }
  //end intercourse function

  //Begin sexual intercourse function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("sexual intercourse")) {// detector for sexual intercourse in chatlog
    chatLog.append("Sex is frowned upon by the regime.");
    chatLog.append("Penalty Applied.");
    chatLog.append("-2 Wealth");
    wealth --;
    wealth --;
  }
  //end sexual intercourse function

  //Begin "have sex" function
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("have sex")) {// detector for have sex in chatlog
    chatLog.append("Sex is frowned upon by the regime.");
    chatLog.append("Penalty Applied.");
    chatLog.append("-2 Wealth");
    wealth --;
    wealth --;
  }
  //end "have sex" function

  //begin spam function
  if ( chatLog.size()!=0 && chatLog.get(chatLog.size() -1).equals("spam")) {// detector for spam in chatlog
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE); 
    JOptionPane.showMessageDialog(
    null, 
    "iGovt Spam Detection System Activated.", 
    "iGovt Spam Defender", 
    JOptionPane.INFORMATION_MESSAGE);
  }

  //begin allah hu ackbar

  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("pizza")) {// detector for pizza in chatlog - cheat code
    nourish += 10;
    wealth += 10;
    intel += 10;
  }
  //end allah hu ackbar

  //begin help function - Lose condition if health reaches 0
  if ( chatLog.size()!=0 && chatLog.get(latestChat).equals("help")) {// detector for help in chatlog
    chatLog.append("Available Commands:");
    chatLog.append("eat, drink, work, read, read government, eat bacon, drink vodka");
    chatLog.append("spam, vote, vote national, vote labour");
    chatLog.append("sudo, shutdown, riot, dissent");
    chatLog.append("hack, root, rm rf, blue pill");
    //end help function
  }
  if (nourish <= 0) {
    JOptionPane.showMessageDialog(
    null, 
    "You have been killed by starvation. Have a nice day.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE); 
    String shutdownCmd = "shutdown -s";
    try {
      Process child = Runtime.getRuntime().exec(shutdownCmd);
    } 
    catch (IOException e)
    { // ignore
    }
  }
  //Wealth Victory - shutdown
  if (wealth >= 100) {
    JOptionPane.showMessageDialog(
    null, 
    "iGovt has detected that you are too wealthy. iGovt will now forcibly purge you from your terminal for the betterment of the nation. Have a nice day.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE); 
    String shutdownCmd = "shutdown -s";
    try {
      Process child = Runtime.getRuntime().exec(shutdownCmd);
    } 
    catch (IOException e)
    { // ignore
    }
  }

  //end wealth victory
  //begin wealth failure - shutdown
  if (wealth <= 0) {
    JOptionPane.showMessageDialog(
    null, 
    "You are bankrupt. iGovt will now forcibly purge you. Have a nice day.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE); 
    String shutdownCmd = "shutdown -s";
    try {
      Process child = Runtime.getRuntime().exec(shutdownCmd);
    } 
    catch (IOException e)
    { // ignore
    }
  }
  //end wealth failure
  //Begin intelligence victory function - shutdown
  if ( intel >= 50 ) {
    JOptionPane.showMessageDialog(
    null, 
    "The iGovt System has deemed you too intelligent. iGovt will soon purge you. Have a nice day.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE);   
    String shutdownCmd = "shutdown -s";
    try {
      Process child = Runtime.getRuntime().exec(shutdownCmd);
    } 
    catch (IOException e)
    { // ignore
    }
  }
  //end intelligence victory function - shutdown

  //Begin nourishment victory function - shutdown
  if ( nourish >= 100 ) {
    JOptionPane.showMessageDialog(
    null, 
    "The iGovt System has deemed you as overweight. iGovt will soon purge you. Have a nice day.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE);   
    String shutdownCmd = "shutdown -s";
    try {
      Process child = Runtime.getRuntime().exec(shutdownCmd);
    } 
    catch (IOException e)
    { // ignore
    }
  }
  //end shutdown function

  // begin hunger timer - attributed to http://www.learningprocessing.com/examples/chapter-10/example-10-4/

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
  //begin tax timer - attributed to http://www.learningprocessing.com/examples/chapter-10/example-10-4/
  // Calculate how much time has passed
  int passedWorkTime = millis() - savedWorkTime;
  // Has five seconds passed?
  if (passedWorkTime > totalWorkTime) {
    savedWorkTime = millis(); // Save the current time to restart the timer!
    wealth --;
    chatLog.append("Your Government demands taxes.");
    chatLog.append(" -1 Wealth.");
  }
  //begin profanity filter
  //fuck
  if ( chatLog.size()!=0 && chatLog.get(chatLog.size() -1).equals("fuck")) {
    JOptionPane.showMessageDialog(
    null, 
    "You have violated the Terms of Use. Please remain at your current location. Do not attempt to flee. Officials shall escort you to the nearest compliance facility shortly.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE); 
    exit();
  }
  //nigger
  if ( chatLog.size()!=0 && chatLog.get(chatLog.size() -1).equals("nigger")) {
    JOptionPane.showMessageDialog(
    null, 
    "You have violated the Terms of Use. Please remain at your current location. Do not attempt to flee. Officials shall escort you to the nearest compliance facility shortly.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE); 
    exit();
  }
  //bitch
  if ( chatLog.size()!=0 && chatLog.get(chatLog.size() -1).equals("bitch")) {
    JOptionPane.showMessageDialog(
    null, 
    "You have violated the Terms of Use. Please remain at your current location. Do not attempt to flee. Officials shall escort you to the nearest compliance facility shortly.", 
    "iGovt Compliance", 
    JOptionPane.WARNING_MESSAGE); 
    exit();
  }
  //cock
  if ( chatLog.size()!=0 && chatLog.get(chatLog.size() -1).equals("cock")) {
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
  //end profanity filter
}


public void mousePressed() {
  menuState = false; // splash screen
  if (menuState == false) {
    menuState1 = true;//game screen trigger
  }
}
public boolean sketchFullScreen() {
  return fullScreenEnabled;
}

//Begin command line segment
public void keyReleased() {
  /**
   typedinput taken from http://wiki.processing.org/index.php/Typed_input
   @author Tom Carden
   */
  if (key != CODED) {// if a key is pressed...
    switch(key) {// which key?
    case BACKSPACE:// backspace key is pressed
      typedText = typedText.substring(0, max(0, typedText.length()-1));// subtract a character from the typedText string
      break;
    case TAB://tab key is pressed
      typedText += "    ";// add a gap to the typedText string
      break;
    case ENTER:// enter is pressed
      chatLog.append(typedText);// add the string of characters in the typedText string to the chatlog string to be checked
      typedText = execute;// future feature TBA
      typedText = "";// wipes the typedText string
      song.play(1);// play coin sound once
      // sound attributed to https://autonline.aut.ac.nz/bbcswebdav/pid-2918937-dt-content-rid-5314633_4/xid-5314633_4

    case RETURN:
      // comment out the following two lines to disable line-breaks
      //  typedText += "\n";
      //   break;
    case ESC:
    case DELETE:
      break;
    default:// any other key?
      typedText += key;// add it into typedText string
    }
  }
  //End command line segment
}

public void keyPressed() {
  
  // escape disabler attributed to http://wiki.processing.org/w/Export_Info_and_Tips
  if (key == ESC) {
    chatLog.append("iGovt IDS");
    chatLog.append("Escape Attempt Thwarted.");
    key = 0;  // Fools! don't let them escape!
  }
}





public void stop() {
  super.stop();
}

