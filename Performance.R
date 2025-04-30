#' @title Plot Performance Surface
#' @description Generate a 3D surface plot of performance metrics across a game map grid.
#' Useful for visualizing heatmaps like kills, damage, or resource collection over zones.
#' @param mat A matrix where each value represents a performance metric (e.g., kills) for a zone.
#' @import rgl grDevices
#' @examples 
#' mat <- matrix(runif(100, 0, 10), nrow = 10)
#' plotPerformanceSurface(mat)
#' @export

plotPerformanceSurface <- function(mat) {
  if (!requireNamespace("rgl", quietly = TRUE) || !requireNamespace("grDevices", quietly = TRUE)) {
    stop("This function requires the 'rgl' and 'grDevices' packages.")
  }
  
  x <- 1:nrow(mat)
  y <- 1:ncol(mat)
  z <- mat

  jet.colors <- grDevices::colorRampPalette(c(
    "#00007F", "blue", "#007FFF", "cyan",
    "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000"
  ))
  colorzjet <- jet.colors(100)

  rgl::open3d()
  rgl::surface3d(
    x, y, z,
    color = colorzjet[findInterval(z, seq(min(z), max(z), length = 100))],
    back = "lines"
  )
  rgl::title3d(xlab = "X-Zone", ylab = "Y-Zone", zlab = "Performance")
  rgl::grid3d(c("z"))
}
