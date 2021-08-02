Game <- R6::R6Class(
  classname = "Game",
  public = list(
    HOLES_N = NULL,
    TIME_MIN = NULL,
    TIME_MAX = NULL,
    DURATION = NULL,
    time_up = TRUE,
    score = 0,
    last_hole = -1,
    initialize = function(holes_n, time_min, time_max, duration) {
      self$HOLES_N <- holes_n
      self$TIME_MIN <- time_min
      self$TIME_MAX <- time_max
      self$DURATION <- duration
    },
    draw_hole = function(holes_n = 6) {
      hole <- sample.int(self$HOLES_N, 1)
      if (hole == self$last_hole) {
        return(self$draw_hole())
      }
      return(hole)
    },
    draw_time = function() {
      runif(1, self$TIME_MIN, self$TIME_MAX)
    },
    peep = function() {
      if (!self$time_up) {
        time <- self$draw_time()
        hole <- self$draw_hole()
        hole_selector <- sprintf("hole%s", hole)
        shinyjs::addClass(hole_selector, "up")
        shinyjs::delay(
          time,
          {
            shinyjs::removeClass(hole_selector, "up")
            self$peep()
          }
        )
      }
    },
    play = function() {
      self$time_up <- FALSE
      self$score <- 0
      self$peep()
      shinyjs::html("score", self$score)
      shinyjs::delay(self$DURATION, self$stop())
    },
    stop = function() {
      self$time_up <- TRUE
    },
    hit = function(hole) {
      shinyjs::removeClass(hole, "up")
      self$score <- self$score + 1
      shinyjs::html("score", self$score)
    }
  )
)