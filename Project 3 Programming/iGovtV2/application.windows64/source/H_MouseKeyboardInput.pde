
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

void keyPressed() {
  if (key == ESC) {
            chatLog.append("iGovt IDS");
        chatLog.append("Escape Attempt Thwarted.");
    key = 0;  // Fools! don't let them escape!
  }
}




void stop() {
  super.stop();
}

