
void draw() {
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

