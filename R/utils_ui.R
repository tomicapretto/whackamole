#' @importFrom shiny tags
make_hole_div = function(num) {
  id = sprintf("hole%s", num)
  tags$div(
    id = id,
    class = "hole",
    tags$div(
      id = id,
      class = "mole",
      onclick = sprintf("hit('%s');", id)
    )
  )
}
