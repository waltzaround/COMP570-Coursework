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
