#' Translator from Swedish ICD-9 to regular ICD-9
#' 
#' Sweden decided to make a few adaptations to the ICD-9
#' system. One of them was to change the last 4th digit into
#' a letter, A:H,W,X, corresponding to the numbers 0-9. 
#' 
#' @param icd A vector or a single string with the ICD-9-code
#' @return \code{vector} Returns a string/vector with the ICD-9 
#'  codes.
#' @export
translate.ICD9.from.Swedish <- function(icd){
 sapply(icd, USE.NAMES=FALSE,
        FUN=function(code){
   translator <- c(A = "0",
                   B = "1",
                   C = "2",
                   D = "3",
                   E = "4",
                   F = "5",
                   G = "6",
                   H = "7",
                   W = "8",
                   X = "9")
   if(nchar(code) > 3){
     letter = toupper(substr(code, 4, 4))
     if (!letter %in% names(translator))
       stop("Error - the Swedish ICD-9 string seems invalid: ", icd,
            " as it does not contain a valid letter at",
            " the fourth position (", letter, ")")
     if (nchar(code) > 5){
       return(paste0(substr(code, 1, 3), 
                     translator[letter],
                     substring(code, 5)))
     }
     
     return(paste0(substr(code, 1, 3), 
                     translator[letter]))
   }
   
   return(icd)
 })
}

#' Dot stripper
#' 
#' ICD-codes have frequently \code{.} in them,
#' e.g. \code{M16.1}. These need to be stripped
#' for the code to work.
#' 
#' @param codes The ICD-codes to be stripped
#' @return \code{vector/matrix} Codes that are stripped from any .
#' @examples
#' preproc.strip.dot(c("M16.1", "M161"))
#' preproc.strip.dot(matrix(c("M16.1", "M162", NA, "M16.9"), ncol=2, nrow=2))
#' @export
preproc.strip.dot <- function(codes){
  if (is.data.frame(codes)) {codes <- as.matrix(codes)}
  return(gsub(".", "", codes, fixed=TRUE))
}