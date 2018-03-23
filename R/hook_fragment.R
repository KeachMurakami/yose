#' Set hooks for knitr hooks for revealjs presentation
#'
#' @description
#' Chunk options \code{fragment_style} and \code{fragment_index} are
#' passed to 'class' and 'fragment-data-index' in html, respectively.
#' This function may usually be evaluated in the setup chunk.
#' 
#' @export
#' @return this function does not return any object.
#' @examples
#' \dontrun{
#' ```{r fragment_style = "fragment fade-up", fragment_index = 3}
#' } 
set_reveal_hooks <-
  function(){
    knitr::knit_hooks$set(fragment_style = hook_fragment_style, fragment_index = hook_fragment_index)
    knitr::opts_chunk$set(fragment_style = "fragment")
  }

#' Knitr hook for styling the fragment appearance
#' 
#' @description
#' This hook is used for adding a 'class' tag to a figure.
#' This hook is usually used along with \code{hook_fragment_index}.
#' In order to close <div> tag correctly, \code{hook_fragment_style} must be passed before the \code{hook_fragment_index}.
#' 
#' @seealso hook_fragment_index
hook_fragment_style <-
  function(before, options, envir) {
    if (before) {
      before_chunk <- paste0("<div class='", options$fragment_style, "' ")
    } else {
      after_chunk <- "</div>"
    }
  }

#' Knitr hook for arranging order of the evaluation of fragments
#' 
#' @description
#' This hook is used for adding a 'data-fragment-index' tag to a figure.
#' This hook is usually used along with \code{hook_fragment_style}.
#' 
#' @seealso hook_fragment_style
hook_fragment_index <-
  function(before, options, envir) {
    if (before) {
      before_chunk <- paste0("data-fragment-index='", options$fragment_index,"' style='position:absolute;top:0;left:0'>")
    }
  }
