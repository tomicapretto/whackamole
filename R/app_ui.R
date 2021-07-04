#' @importFrom shiny tags
app_ui = function() {
  shiny::tagList(
    tags$html(
      tags$head(
        shinyjs::useShinyjs(),
        tags$title("Whack A Mole!"),
        tags$link(
          href = "https://fonts.googleapis.com/css?family=Amatic+SC:400,700",
          rel = "stylesheet",
          type = "text/css"
        ),
        tags$link(
          rel = "stylesheet",
          href = "www/style.css"
        ),
        tags$script(
          type = "text/javascript",
          src = "www/scripts.js"
        )
      ),
      tags$body(
        tags$h1(
          "Whack-a-mole!",
          tags$span(class = "score", id = "score", 0)
        ),
        tags$div(
          class = "btns",
          shiny::actionButton(
            inputId = "play",
            label = "Play!"
          ),
          shiny::actionButton(
            inputId = "stop",
            label= "Stop"
          )
        ),
        tags$div(
          class = "game",
          lapply(seq(HOLES_N), make_hole_div)
        )
      )
    )

  )
}
