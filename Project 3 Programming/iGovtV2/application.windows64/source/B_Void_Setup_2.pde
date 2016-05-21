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


