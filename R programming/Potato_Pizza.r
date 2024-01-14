# Pizza Type
TYPE <- c("Hawaiian", "Vegetarian", "Cheese", "Peporoni", "House Special")
PRICE <- c(6.99, 5.99, 6.99, 6.99, 7.99)
pizza_type <- data.frame(ID = 1:5, TYPE, PRICE)

# Pizza Size
SIZE <- c("small", "medium", "large", "extra large", "jumbo")
SLICE <- c(4, 6, 8, 10, 12)
CHARGE <- c(0, 2, 4, 6, 8)
pizza_charge <- data.frame(ID = 1:5, SIZE, SLICE, CHARGE)

# Pizza Topping
TOPPING <- c("mushroom", "pineapple", "peporoni", "pizza sauce", "cheese", "bacon", "seafood", "no topping")
EXTRA <- c("1", "1", "1.5", "1.5", "2", "2", "3", "0")
pizza_topping <- data.frame(ID = 1:8, TOPPING, EXTRA)


count <- 0
sum <- 0

pizza_chatbot <- function() {
## Process
#Welcome
  cat("((_Welcome_)) > Type > Size > Topping > Extra Topping > Summarize\n")
  cat("\n----------- Hello ! Welcome to Potato's Pizza House ! -------------\n")
  cat("What's your name ?  ")
  user_name <- readLines("stdin", n=1)
  cat("\n\t\t\t\t\tHello", toupper(user_name), ":) , Let's order your pizza !")
  cat("\n----------------------------------------------------------------------\n\n")

# Ordering type of pizza
while (TRUE) { 
  cat("\nWelcome > ((_Type_)) > Size > Topping > Extra Topping > Summarize\n\n")
  print(pizza_type, row.names = F)
    while (TRUE) {
      cat("\n\t\t\t\t\tChoose ID for select type of pizza :  ")
      w <- readLines("stdin", n=1)
        if (w %in% pizza_type$ID) {
          a <- pizza_type[w, 2]
          b <- pizza_type[w, 3]
          break
        } else {
          print("Incorrect pizza id!!")
        }
    } 
    cat("\t\t\t\t>>  You Choose: ", a, "//  $", b," <<")
    cat("\n----------------------------------------------------------------------\n\n")
  

# Ordering size of pizza
    cat("Welcome > Type > ((_Size_)) > Topping > Extra Topping > Summarize\n\n")
    print(pizza_charge, row.names = F)
    while (TRUE) {
      cat("\n\t\t\t\t\tChoose ID for select size of pizza :  ")
      x <- readLines("stdin", n=1)
        if (x %in% pizza_charge$ID) {
          c <- pizza_charge[x, 2]
          d <- pizza_charge[x, 3]
          e <- pizza_charge[x, 4]
          break
        } else {
          print("Incorrect size id!!")
        }
    }
    cat("\t\t\t\t>>  You Choose: ", c, "size // ", d, "slices", "//  $",e," <<")
    cat("\n----------------------------------------------------------------------\n\n")

# Ordering topping of pizza
    cat("Welcome > Type > Size > ((_Topping_)) > Extra Topping > Summarize\n\n")
    print(pizza_topping, row.names = F)
    while (TRUE) {
      cat("\n\t\t\t\t\tChoose ID for select topping :  ")
      y <- readLines("stdin", n=1)
        if (y %in% pizza_topping$ID) {
          f <- pizza_topping[y, 2]
          g <- as.numeric(pizza_topping[y, 3])
          break
        } else {
          print("Incorrect topping id!!")
        }
    }
    cat("\t\t\t\t>>  You Choose: ", f, "//  $", g, " <<")
    cat("\n----------------------------------------------------------------------\n\n")

# Ordering extra topping of pizza
    cat("Welcome > Type > Size > Topping > ((_Extra Topping_)) > Summarize\n\n")
    print(pizza_topping, row.names = F)
    while (TRUE) {
      cat("\n\t\t\t\t\tChoose ID for select topping :  ")
      z <- readLines("stdin", n=1)
        if (z %in% pizza_topping$ID) {
          h <- pizza_topping[z, 2]
          i <- as.numeric(pizza_topping[z, 3])
          break
        } else {
          print("Incorrect topping id!!")
        }
    }
    cat("\t\t\t\t>> You Choose: ", h, "//  $", i, "<<")
    cat("\n----------------------------------------------------------------------\n\n")

# Summarize pizza order
    cat("Welcome > Type > Size > Topping > Extra Topping > ((_Summarize_))\n\n")
    pizza_list <- list(Type = pizza_type[w, c(2,3)],
                      Size = pizza_charge[x, c(2,3,4) ],
                      Topping =  pizza_topping[y, c(2,3)], 
                      Extra_Topping = pizza_topping[z, c(2,3)])
    print(pizza_list)
    price <- b + e + g + i
    cat(">>> Price : $", price, " <<<\n")
    count <- count + 1
    sum <- sum + price
  
    
      while (TRUE) {
        cat("Would you like to order more pizza? (y/n) : ")
        reorder <- tolower(readLines("stdin", n=1))
        if (reorder != "y" & reorder != "n" ) {
          print(paste("Please select y or n"))
        } else {
          break
        }
      }
  
    if (reorder == "n") {
      cat("\n----------------------------------------------------------------------")
      cat("\nTotal of pizza : ", count)
      cat("\nTotal Price : $", sum, "\n")
      cat("\n\t\t\tThank you", toupper(user_name), "for ordering pizza with Potato!")
      cat("\n\t\t\t\t\t\tHave a nice day :))\n\n")
      break
    } else {
      cat("\n----------------------------------------------------------------------")
    }
  }
  
}
#call the function
pizza_chatbot()
