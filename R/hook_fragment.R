#' Set hooks for knitr hooks for revealjs presentation
#'
#' @description
#' Chunk options \code{fragment_style} and \code{fragment_index} are
#' passed to 'class' and 'fragment-data-index' in html, respectively.
#' This function may usually be evaluated in the setup chunk.
#'
#' @export
#' @return this function does not return any object.
set_reveal_hooks <-
  function(){
    knitr::knit_hooks$set(fragment_style = hook_fragment_style, fragment_index = hook_fragment_index)
    knitr::opts_chunk$set(fragment_style = "fragment", fragment_index = -1,
                          echo = FALSE, warning = FALSE, message = FALSE, float = T)
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
      before_chunk <- dplyr::if_else(options$fragment_index < 0,
                                     "<div ",
                                     paste0("<div class='", options$fragment_style, "' "))
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
      in_reveal_position <- if_else(options$float == TRUE, "relative", "absolute")
      before_chunk <- dplyr::if_else(options$fragment_index < 0,
                                     paste0("style='position:", in_reveal_position, "; top:0; left:0'>"),
                                     paste0("data-fragment-index='", options$fragment_index, "' style='position:", in_reveal_position, "; top:0; left:0'>"))
    }
  }
