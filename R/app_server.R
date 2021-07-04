app_server = function(input, output, session) {
  game = Game$new(HOLES_N, TIME_MIN, TIME_MAX, DURATION)

  shiny::observeEvent(input$play, {
    shiny::req(game$time_up)
    game$play()
  })

  shiny::observeEvent(input$stop, {
    game$stop()
  })

  shiny::observeEvent(input$hit, {
    game$hit(input$hole)
  })
}
