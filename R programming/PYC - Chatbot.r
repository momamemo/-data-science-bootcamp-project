##https://replit.com/@MayPimchanok/pizza#PYC.r
pyc <- function() {
  #input data
  number <- c(1:4)
  choice <- c("Rock", "Paper", "Scissor", "Exit")
  round <- 0
  win <- 0
  lose <- 0
  draw <- 0

  #Welcome
  cat("Welcome to Rock Paper Scissor Game !")
  cat("\nChoose your weapon by typing the number following\n")
  #cat("\n[ 1 ] : Rock // [ 2 ] : Paper // [ 3 ] : Scissor // [ 4 ] : Exit\n")
  names(number) <- choice
  print(number)

    #Checking incorrect input
    while (TRUE) {
      cat("\nPick your weapon [1-4] : ")
      user <- readLines("stdin", n=1)
      
      if ((user %in% number) & user != 4) {
        bot <- sample(c(1:3), 1)
        user <- as.numeric(user)
        
          if ( user == 1 & bot == 3 ) {
            cat("You :", choice[user], " //  Bot :", choice[bot], "\t>>  You Win !")
            win <- win + 1
            round <- round + 1
          } else if ( user == 2 & bot == 1 ) {
            cat("You :", choice[user], " //  Bot :", choice[bot], "\t>>  You Win !")
            win <- win + 1
            round <- round + 1
          } else if ( user == 3 & bot == 2 ) {
            cat("You :", choice[user], " //  Bot :", choice[bot], "\t>>  You Win !")
            win <- win + 1
            round <- round + 1
          } else if ( user == bot ) {
            cat("You :", choice[user], " //  Bot :", choice[bot], "\t>>  You Draw !")
            draw <- draw + 1
            round <- round + 1
          } else {
            cat("You :", choice[user], " //  Bot :", choice[bot], "\t>> You lose !")
            lose <- lose + 1
            round <- round + 1
          }
      } else if (!(user %in% number) &  user != 4)  { 
        cat("Incorrect number, Please try again !")
      } else {
        break
      }
  
    cat("\n")

  }

  #Summarize
    cat("\n----------------------------------------------------------------------\n")
    win_rate <- (win / (win+round)) * 100
    sum <- data.frame (Round = round, Win = win, 
                       Lose = lose, Draw = draw, 
                       Win_Rate = win_rate) 
    print(sum, row.names = F)

}

pyc()
