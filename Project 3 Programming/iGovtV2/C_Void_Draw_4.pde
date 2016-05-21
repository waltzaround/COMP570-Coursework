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

