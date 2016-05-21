// begin hunger timer

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
//begin tax timer
// Calculate how much time has passed
int passedWorkTime = millis() - savedWorkTime;
// Has five seconds passed?
if (passedWorkTime > totalWorkTime) {
  savedWorkTime = millis(); // Save the current time to restart the timer!
  wealth --;
      chatLog.append("Your Government demands taxes.");
          chatLog.append(" -1 Wealth.");
}

