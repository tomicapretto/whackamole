let count = 0;

function hit(id) {
  Shiny.setInputValue("hit", count++);
  Shiny.setInputValue("hole", id);
}
