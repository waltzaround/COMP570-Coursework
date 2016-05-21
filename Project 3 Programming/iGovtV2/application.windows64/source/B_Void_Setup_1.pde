
void setup() {
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
