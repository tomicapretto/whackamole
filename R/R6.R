Game = R6::R6Class(
  classname = "Game",
  public = list(
    HOLES_N = NULL,
    TIME_MIN = NULL,
    TIME_MAX = NULL,
    DURATION = NULL,
    time_up = TRUE,
    score = 0,

    initialize = function(holes_n, time_min, time_max, duration) {
      self$HOLES_N = holes_n
      self$TIME_MIN = time_min
      self$TIME_MAX = time_max
      self$DURATION = duration
    },

    draw_hole = function(holes_n = 6) {
      sprintf("hole%s", sample.int(self$HOLES_N, 1))
    },

    draw_time = function() {
      runif(1, self$TIME_MIN, self$TIME_MAX)
    },

    peep = function() {
      time = self$draw_time()
      hole = self$draw_hole()
      shinyjs::addClass(hole, "up")
      shinyjs::delay(time, shinyjs::removeClass(hole, "up"))
      if (!self$time_up) {
        shinyjs::delay(time, self$peep())
      }
    },

    play = function() {
      self$time_up = FALSE
      self$score = 0
      self$peep()
      shinyjs::html("score", self$score)
      shinyjs::delay(self$DURATION, self$stop())
    },

    stop = function() {
      self$time_up = TRUE
    },

    hit = function(hole) {
      shinyjs::removeClass(hole, "up")
      self$score = self$score + 1
      shinyjs::html("score", self$score)
    }
  )
)
