#' Show layered-figures incrementally
#'
#' @description.
#' This function is usually used as inline in revealjs_presentation.
#'
#' @export
#' @return this function returns chunks which shows figures.
#' @examples
#' \dontrun{
#' <!--start rmarkdown-->
#' ---
#'   output: revealjs::revealjs_presentation
#' ---
#'
#' # h1 level
#'
#' ```{r}
#' library(knitr)
#' library(tidyverse)
#' library(yose)
#' yose::set_reveal_hooks()
#'
#' p <-
#'   lapply(2:5, function(x){
#'     tibble(x = 1:5, y = x * 2, index = 1:5)[1:x, ] %>%
#'       ggplot(aes(x, y)) +
#'       geom_point() +
#'       geom_line() +
#'       lims(x = c(0, 5), y = c(0, 10))
#'   })
#' ```
#'
#' ## h2 level
#'
#' `r yose::kamishibai(p)`
#' <!--end rmarkdown-->
#' }
kamishibai <-
  function(figure_list, div = "top:0px; width:800px; height:600px; margin:0 auto"){
    assign("p", figure_list)

    src <-
      map(seq_along(p), function(x) {
        knit_expand(
          text = c(
            "```{r, fragment_index = {{x}}, echo = F}",
            "print(p[[{{x}}]])",
            "```"))
      }) %>%
      unlist

    paste(knit(text = src), sep = "\n") %>%
      stringr::str_glue("<div style='position:relative; {div}'>\n",
                        .,
                        "</div>\n")
  }
