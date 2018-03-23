<!-- README.md is generated from README.Rmd. Please edit that file -->
yose (寄席)
===========

This package implements incremental figure display in {revealjs} slide. `yose` is a Japanese word meaning storytelling [-&gt; Google Images](https://www.google.co.jp/search?q=%E5%AF%84%E5%B8%AD&source=lnms&tbm=isch&sa=X&ved=0ahUKEwix35LSoYHaAhVJlJQKHQKKARYQ_AUICygC&biw=1280&bih=924).

Usage
-----

You can install the latest development version from github with

``` r
# install.packages("devtools") # if not installed
devtools::install_github("KeachMurakami/yose")
```

Try the following minimal `.rmd`.

``` r
#> ---
#> output: revealjs::revealjs_presentation
#> ---
#> 
#> ```{r setup}
#> yose::set_reveal_hooks()
#> ```
#> 
#> # Section1
#> 
#> ## Section1-1
#> 
#> <div style="position:relative; top:0px; width:800px; height:600px; margin:0 auto;">
#> ```{r fragment_index = 1, echo = F}
#> plot(mtcars$mpg, mtcars$disp)
#> ```
#> ```{r fragment_style = 'fragment fade-up', fragment_index = 3, echo = F}
#> plot(mtcars$mpg, mtcars$disp)
#> text("a", x = 30, y = 400)
#> ```
#> </div>
#> <div class="fragment" data-fragment-index="2">- plot points</div>
#> <div class="fragment" data-fragment-index="4">- add a comment</div>
```

LICENCE
-------

This package is free and open source software, licensed under GPL.

Session information
-------------------

    #> Warning: package 'revealjs' was built under R version 3.3.2
    #> Warning: package 'rmarkdown' was built under R version 3.3.2
    #> Session info --------------------------------------------------------------
    #>  setting  value                       
    #>  version  R version 3.3.1 (2016-06-21)
    #>  system   x86_64, darwin13.4.0        
    #>  ui       X11                         
    #>  language (EN)                        
    #>  collate  en_US.UTF-8                 
    #>  tz       Asia/Tokyo                  
    #>  date     2018-03-23
    #> Packages ------------------------------------------------------------------
    #>  package   * version    date       source                          
    #>  backports   1.0.4      2016-10-24 cran (@1.0.4)                   
    #>  devtools    1.12.0     2016-06-24 CRAN (R 3.3.0)                  
    #>  digest      0.6.13     2017-12-14 cran (@0.6.13)                  
    #>  evaluate    0.10.1     2017-06-24 cran (@0.10.1)                  
    #>  htmltools   0.3.6      2017-04-28 cran (@0.3.6)                   
    #>  knitr     * 1.17       2017-08-10 cran (@1.17)                    
    #>  magrittr    1.5        2014-11-22 CRAN (R 3.3.1)                  
    #>  memoise     1.0.0      2016-01-29 CRAN (R 3.3.1)                  
    #>  Rcpp        0.12.14    2017-11-23 cran (@0.12.14)                 
    #>  revealjs  * 0.9        2017-03-13 CRAN (R 3.3.2)                  
    #>  rmarkdown * 1.6        2017-06-15 CRAN (R 3.3.2)                  
    #>  rprojroot   1.2        2017-01-16 cran (@1.2)                     
    #>  stringi     1.1.6      2017-11-17 CRAN (R 3.3.2)                  
    #>  stringr     1.3.0      2018-02-19 CRAN (R 3.3.1)                  
    #>  withr       2.1.1.9000 2017-12-23 Github (jimhester/withr@df18523)
    #>  yaml        2.1.14     2016-11-12 cran (@2.1.14)
