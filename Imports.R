#' @title Import Game Data
#' @description Imports and cleans game zone performance data from a file called "gamedata.csv".
#' The file should contain X, Y coordinates and a Z value (performance metric like kills or damage).
#' @name importGameData
#' @examples
#' importGameData()
#' @import readr
#' @export

importGameData <- function() {
  if (!file.exists("gamedata.csv")) {
    stop("File 'gamedata.csv' not found in the working directory.")
  }

  raw <- read.csv("gamedata.csv", header = TRUE)

  # Expecting columns named X, Y, Z
  if (!all(c("X", "Y", "Z") %in% names(raw))) {
    stop("Data must contain columns named 'X', 'Y', and 'Z'.")
  }

  # Clean and parse numbers
  raw$X <- readr::parse_number(raw$X, na = c("", "NA"))
  raw$Y <- readr::parse_number(raw$Y, na = c("", "NA"))
  raw$Z <- readr::parse_number(raw$Z)

  cleaned <- raw[complete.cases(raw), ]

  assign("game_data", cleaned, envir = .GlobalEnv)
  return(cleaned)
}
