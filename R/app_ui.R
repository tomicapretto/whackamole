#' Title
#'
#' @export
#' @importFrom shiny tagList tags
app_ui = function() {
  tags$head(
    tags$head(
      tags$title("Whack A Mole!"),
      tags$link(
        href = "https://fonts.googleapis.com/css?family=Amatic+SC:400,700",
        rel = "stylesheet",
        type = "text/css"
      ),
      tags$link(
        rel = "stylesheet",
        hred = "style.css"
      )
    )
  )
}
