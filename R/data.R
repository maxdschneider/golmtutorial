# Unit Hydrograph - linear storage cascade
# Berry Boessenkool,   berry-b@gmx.de
# Data for debugging exercise
# obtained with dput from ?lsc in library(berryFunctions)



#' Rainfall and streamflow data
#'
#' Timeseries of catchment precipitation  (P, mm/h) and discharge, which is streamflow at the outlet (Q, m^3/s).
#' The data is split up in a calibration and validation period and consists of
#' two data.frames: \code{calib} and \code{valid}.\cr
#' The catchment is small, approcimately 1.6 km^2.
#'
#' @name calib
#' @aliases calib valid
#' @docType data
#' @format data.frame with numerical vectors for Q and P
#' @source Some hydrology course at Potsdam University
#' @seealso \code{\link{lsc}}
#' @author Berry Boessenkool, \email{berry-b@@gmx.de}, 2013
#' @keywords datasets
#' @examples
#'
#' \donttest{
#' data(calib)
#' data(valid)
#' head(calib)
#' }
#'


# This needs to be executed once by hand.
# Simply replace FALSE with TRUE, source this file and then set it to FALSE again.

if(FALSE)
{

calib <- data.frame(Q = c(0.089, 0.089, 0.089, NA, 0.089, 0.089,
0.089, 0.089, 0.089, 0.089, 0.089, 0.089, 0.089, 0.089, 0.089,
0.075, 0.253, 0.431, 0.892, 1.115, 1.173, 1.016, 0.856, 0.757,
0.71, 0.65, 0.607, 0.552, 0.512, 0.475, 0.438, 0.415, 0.349,
0.349, 0.329, 0.308, 0.308, 0.28, 0.271, 0.271, 0.235, 0.235,
0.235, 0.235, 0.211, 0.203, 0.203, 0.196, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.146, 0.146, 0.146, 0.146, 0.146, 0.146, 0.133,
0.121, 0.121, 0.121, 0.121, 0.121, 0.121, 0.121, 0.121, 0.121,
0.121, 0.121, 0.121, 0.121, 0.121, 0.121, 0.121, 0.121, 0.121,
0.121, 0.121, 0.173),
P = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0.85, 9.25, 14.55, 4.05, 1.5, 0.6, 0.5, 1.15, 0.65,
0.65, 0.25, 0, 0.05, 0, 0, 0.05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0))

valid <- data.frame(Q = c(0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.166, 0.146, 0.146, 0.146,
0.146, 0.146, 0.146, 0.146, 0.146, 0.146, 0.146, 0.146, 0.146,
0.146, 0.146, 0.146, 0.146, 0.146, 0.146, 0.146, 0.146, 0.146,
0.146, 0.146, 0.146, 0.146, 0.146, 0.146, 0.16, 0.181, 0.262,
0.404, 0.539, 0.593, 0.593, 0.593, 0.538, 0.5, 0.475, 0.438,
0.426, 0.392, 0.381, 0.349, 0.349, 0.329, 0.308, 0.308, 0.329,
0.477, 0.878, 1.278, 2.029, 2.335, 2.107, 1.737, 1.474, 1.255,
1.133, 1.054, 1.113, 1.429, 1.788, 1.943, 1.813, 1.614, 1.428,
1.275, 1.173, 1.074, 0.998, 0.926, 0.891, 0.839, 0.789, 0.773,
0.726, 0.71, 0.665, 0.65, 0.65, 0.593, 0.593, 0.593, 0.593, 0.566,
0.538, 0.538, 0.538, 0.487, 0.487, 0.487, 0.487, 0.487, 0.487,
0.487, 0.487, 0.487, 0.487, 0.487, 0.487, 0.487, 0.487, 0.487,
0.487, 0.487, 0.487, 0.415, 0.392, 0.392, 0.392, 0.392, 0.392,
0.392, 0.392, 0.392, 0.392, 0.392, 0.392, 0.392, 0.392, 0.392,
0.392, 0.392, 0.392, 0.392, 0.392, 0.392, 0.392, 0.349, 0.349,
0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349,
0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349,
0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349,
0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349, 0.349,
0.339, 0.308, 0.308, 0.308, 0.308, 0.308, 0.308, 0.308, 0.308,
0.308, 0.308, 0.308, 0.308, 0.308, 0.308, 0.308, 0.308, 0.308,
0.308, 0.308, 0.308, 0.308, 0.308, 0.308, 0.308, 0.289, 0.271,
0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271,
0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271,
0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271,
0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271,
0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271,
0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271, 0.271,
0.271, 0.271, 0.271, 0.271, 0.262, 0.235, 0.235, 0.235, 0.235,
0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235,
0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235,
0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235,
0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235,
0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.235, 0.227, 0.203,
0.203, 0.203, 0.203, 0.203, 0.203, 0.203, 0.203, 0.203, 0.203,
0.203, 0.203, 0.203, 0.203, 0.203, 0.203, 0.203, 0.203, 0.203,
0.203, 0.203, 0.203, 0.203, 0.203, 0.203, 0.203, 0.203, 0.203,
0.203, 0.203, 0.203, 0.203, 0.203, 0.181, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173,
0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173, 0.173),
P = c(0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0.05, 0.15, 0.5, 0.55, 0, 0.05, 0, 0.05, 0.05, 0, 0,
0.3, 2.35, 1.7, 3.65, 4.9, 4.45, 0.45, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0.05, 2.3, 4.75, 5.25, 2.4, 2.1, 4.8, 0.5, 0,
0, 0, 0.45, 0.7, 1.85, 3.2, 2.9, 1.3, 0.6, 0.2, 0.15, 0, 0.05,
0.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0.05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.2, 0, 0, 0, 0, 0,
0, 0, 0, 0.05, 0, 0, 0, 0.05, 0, 0.1, 0.05, 0.05, 0, 0, 0.05,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.05, 0.1, 0,
0, 0, 0, 0, 0.1, 0.1, 0.75, 0.2, 0, 0, 0.05, 0.5, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.05, 0.2, 0.1,
0.05, 0.1, 0.05, 0, 0, 0.15, 0.35, 0.45, 0.05, 0, 0, 0, 0, 0,
0, 0, 0, 0.05, 0, 0.1, 0, 0, 0, 0, 0, 0.05, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.05, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0))


devtools::use_data(calib, valid)

}
