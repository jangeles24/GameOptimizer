#' @title Simulate Grid-Based Strategy
#' @description Simulate how a player performs across different zones of a grid-based game map. 
#' Useful for evaluating movement or resource-collection strategies.
#' @name simulateGridStrategy
#' @param x Number of columns in the grid (horizontal zones).
#' @param y Number of rows in the grid (vertical zones).
#' @param strategy A character string representing the strategy type: "aggressive", "defensive", or "balanced".
#' @return A data.frame showing simulated performance metrics per zone.
#' @examples
#' simulateGridStrategy(5, 5, "aggressive")
#' @export

simulateGridStrategy <- function(x, y, strategy = "balanced") {
  set.seed(123)
  
  grid <- expand.grid(X = 1:x, Y = 1:y)

  multiplier <- switch(strategy,
    "aggressive" = 1.2,
    "defensive" = 0.8,
    "balanced" = 1.0,
    1.0
  )

  grid$kills <- round(rnorm(nrow(grid), mean = 5, sd = 2) * multiplier)
  grid$damage <- round(rnorm(nrow(grid), mean = 300, sd = 50) * multiplier)
  grid$resources_collected <- round(rnorm(nrow(grid), mean = 10, sd = 3) * multiplier)

  return(grid)
}
