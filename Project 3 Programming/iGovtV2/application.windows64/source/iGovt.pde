
import javax.swing.*;
import ddf.minim.*;

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


