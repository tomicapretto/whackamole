#' Run the Shiny Application
#'
#' @export
#' @importFrom shiny shinyApp runApp invalidateLater
run_app <- function() {
  runApp(shinyApp(ui = app_ui, server = app_server))
}