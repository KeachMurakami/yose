#' Insert footer field to revealjs slide
#'
#' @description.
#' This function is usually used as inline in revealjs_presentation.
#' For now, the top end of the footer is controled manually by body_height argument.
#'
#' @export
#' @return this function returns <div> tag for the footer.
start_footer <-
  function(height = "100px", body_heigth = "600px", color = "#555555", backgroundcolor = "#aaaaaa"){
    stringr::str_glue("<div style='position:absolute; top:{body_heigth}; left:-50%; width:200%; height:{height}; color:{color}; background-color:{backgroundcolor}'>") %>%
      htmltools::HTML()
  }
