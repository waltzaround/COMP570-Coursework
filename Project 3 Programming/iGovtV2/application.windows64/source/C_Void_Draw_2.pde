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


