#' Insert horizontal field to revealjs slide (e.g. footer, header)
#'
#' @description.
#' This function is usually used as inline in revealjs_presentation.
#' For now, the ribbon position is controled manually by offset argument.
#' Elements other than style (e.g. class) will be controlled by passing a list.
#'
#' @export
#' @return this function returns <div> tag for the footer.
add_ribbon <-
  function(height = 100, offset = 50, pad = 10, em = .5, other_list = NULL, ...){
    style = list(position = "absolute", left = "-50%", width = "200%",
                 top = str_c(offset, "px"), height = str_c(height + offset + pad, "px"), padding = str_c(pad, "px"), `font-size` = em, ...)

    generate_tag(styles = style, others = other_list, tag = "<div ") %>%
      return()
  }


#' Convert R list object for css styling to css element
#'
#' @description.
#' styles are determined with this internal function.
#'
#' @return this function returns chr (style='foo: bar;')
parse_style <-
  function(style_list){
    if_else(is.null(style_list),
      "",
      style_list %>%
        purrr::imap(~str_c(.y, ":", .x)) %>%
        stringr::str_c(collapse = "; ") %>%
        stringr::str_c("style='", ., "'") %>%
        paste0(""))
  }

#' Convert R list object to css element
#'
#' @description.
#' parameters other than style (e.g. class) are determined with this internal function.
#'
#' @return this function returns chr (class='foo: bar;')
parse_other <-
  function(other_list){
    if_else(is.null(other_list),
      "",
      other_list %>%
        purrr::imap(~str_c(.y, "='", .x, "'")) %>%
        stringr::str_c(collapse = " ") %>%
        paste0(""))
  }

#' Generate complete html tag by merging elements
#'
#' @description.
#' merge css elements to complete html tag.
#'
#' @return this function returns chr (class='foo: bar;')
generate_tag <-
  function(styles, others, tag = c("<div ", "<span ")[1]){
    stringr::str_c(parse_style(styles), parse_other(others), sep = " ") %>%
      stringr::str_trim(side = "both") %>%
      stringr::str_c("<div ", ., ">") %>%
      htmltools::HTML() %>%
      return()
  }
