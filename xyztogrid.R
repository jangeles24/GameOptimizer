#' @title xyztogrid
#' @name xyztogrid
#' @description Converts XYZ columns into a grid matrix.
#' @param x The X values.
#' @param y The Y values.
#' @param z The Z values (can represent any numerical game-related metric like performance, score, etc.).
#' @import reshape2
#' @examples 
#' xyztogrid(c(1,2,3), c(1,2,3), c(10,20,30))
#' @export
#' 
#' #devtools::use_package("reshape2", "imports")

xyztogrid <- function(x, y, z) {
  # Combine x, y, z into a data frame
  bed <- data.frame(X = x, Y = y, Z = z)
  
  # Reshape the data to a grid
  m <- reshape2::acast(bed, X ~ Y, value.var = "Z")
  
  # Return the resulting grid
  return(m)
}
