set_reveal_hooks <-
  function(){
    knitr::knit_hooks$set(fragment_style = hook_fragment_style, fragment_index = hook_fragment_index)
    knitr::opts_chunk$set(fragment_style = "fragment")
  }

hook_fragment_style <-
  function(before, options, envir) {
    if (before) {
      before_chunk <- paste0("<div class='", options$fragment_style, "' ")
    } else {
      after_chunk <- "</div>"
    }
  }

hook_fragment_index <-
  function(before, options, envir) {
    if (before) {
      before_chunk <- paste0("data-fragment-index='", options$fragment_index,"' style='position:absolute;top:0;left:0'>")
    }
  }
