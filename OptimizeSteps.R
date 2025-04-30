#' @title optimizeSteps
#' @description Calculate the optimized steps per frame or per action for a given game based on relevant parameters.
#' @name optimizeSteps
#' @param fps The game's frames per second (fps).
#' @param action_time The average time taken for a single action in the game (in seconds).
#' @param input_steps The number of steps (or actions) needed to complete a frame/action.
#' @param optimization_factor A factor that adjusts how aggressive the optimization should be.
#' @examples 
#' optimizeSteps(60, 0.2, 5, 1.1)
#' @export

optimizeSteps <- function(fps, action_time, input_steps, optimization_factor) {
  steps_per_frame <- fps * action_time
  optimized_steps <- (input_steps * steps_per_frame) * optimization_factor
  return(optimized_steps)
}
