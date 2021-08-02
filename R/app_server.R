app_server <- function(input, output, session) {
  game <- Game$new(HOLES_N, TIME_MIN, TIME_MAX, DURATION)

  # Initialize the timer, 10 seconds, not active.
  TIME_LEFT <- shiny::reactiveVal(DURATION)
  PLAYING <- shiny::reactiveVal(FALSE)

  shiny::observe({
    shiny::req(PLAYING())
    shiny::invalidateLater(1000, session)
    shiny::isolate({
      shinyjs::html(
        "time-left",
        paste(round(TIME_LEFT() / 1000), "seconds")
      )
      adjustBarWidth((TIME_LEFT() / DURATION) * 100)

      TIME_LEFT(TIME_LEFT() - 1000)
      if (TIME_LEFT() < 0) PLAYING(FALSE)
    })
  })

  shiny::observe({
    shiny::req(!PLAYING())
    shinyjs::html("time-left", "0 seconds")
  })

  shiny::observeEvent(input$play, {
    shiny::req(game$time_up)
    game$play()
    TIME_LEFT(DURATION)
    PLAYING(TRUE)
  })

  shiny::observeEvent(input$stop, {
    game$stop()
    PLAYING(FALSE)
    adjustBarWidth(0)
  })

  shiny::observeEvent(input$hit, {
    game$hit(input$hole)
  })
}


adjustBarWidth <- function(pct) {
  code <- paste0(
    "document.getElementById('bar').style.flexBasis = '", pct, "%';"
  )
  shinyjs::runjs(code)
}
