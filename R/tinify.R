#' Compress image with tinypng API
#'
#' @description.
#' Compress JPG/PNG image via tinypng API.
#' API key should be stored as global options for security.
#'
#' @param path file path to the image file
#' @export
#' @return this function returns <div> tag for the footer.
tinify <-
  function(path){
    if(!file.exists(path)){
      stop("File not found")
    } else {

       api_key <- Sys.getenv("tinypng_api")
       catch_response <-
         system(intern = T,
                paste0("curl --user api:", api_key,
                       " --data-binary @", path,
                       " -i https://api.tinify.com/shrink"))
       image_url <-
         catch_response[stringr::str_detect(catch_response, "Location")] %>%
         stringr::str_extract("output/[a-zA-Z0-9]*")

      if(length(image_url) == 0){
        stop(print(catch_response))
      } else {
        download.file(url = paste0("https://api.tinify.com/", image_url),
                      destfile = path)
        cat(paste0("file (", path, ") was appropriately tinified\n"))
      }
    }
  }
