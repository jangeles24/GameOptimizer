#' @title optimizeFPS
#' @description Adjusts game performance parameters for optimal frame rates. Takes input for the original frame rate and applies a multiplier based on hardware optimization factors to adjust it.
#' @name optimizeFPS
#' @param original_fps The original frame rate of the game (frames per second).
#' @param hardware_factor The factor representing the impact of hardware improvements (e.g., faster GPU, more RAM).
#' @examples 
#' optimizeFPS(60, 1.2)
#' @export

optimizeFPS <- function(original_fps, hardware_factor) {
  adjusted_fps <- original_fps * hardware_factor
  return(adjusted_fps)
}
