#' @title Resource Efficiency Score
#' @description Calculate a player's resource efficiency score based on skill level, equipment quality, strategy, and item effectiveness.
#' @name resourceEfficiencyScore
#' @param skill Numeric value for player skill level (1–100).
#' @param equipment Numeric value for equipment effectiveness (1–10).
#' @param strategy A multiplier for strategy efficiency (e.g., 0.8 for risky, 1.0 for balanced, 1.2 for efficient).
#' @param item_use Efficiency of the item being used (1–10 scale).
#' @examples 
#' resourceEfficiencyScore(85, 8, 1.2, 7)
#' @export

resourceEfficiencyScore <- function(skill, equipment, strategy, item_use) {
  score <- (skill * equipment) * strategy / (item_use * pi)
  return(round(score, 2))
}
