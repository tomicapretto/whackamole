app_sys = function(...) {
  system.file(..., package = "whackamole", mustWork = TRUE)
}

.onLoad = function(libname, pkgname) {
  shiny::addResourcePath(
    prefix = "www",
    directoryPath =  app_sys("www")
  )
}

.onUnload = function(libname, pkgname) {
  shiny::removeResourcePath("www")
}

HOLES_N = 6
TIME_MIN = 200
TIME_MAX = 1000
DURATION = 10000
