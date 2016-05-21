
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
