
#' Interval spolehlivosti pro korelacni koeficient \eqn{\rho}
#'
#' Funkce pro vypocet instervalu spolehlivosti korelacniho koeficientu \eqn{\rho}
#
#
#' @param b Odhad parametru beta.
#' @param s Smerodatna odchylka parametru beta.
#' @param n Pocet pozorovani.
#' @param p Pocet parametru v modelu (bez urovonove konstanty).
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita oboustranny interval spolehlivosti pro \eqn{\beta}.
#' @export
is_rho <- function(r, n, alfa = 0.05, dec = 10){
  z <- (1 / 2) * log((1 + r) / (1 - r))

  o_d <- tanh(z - ((qnorm(p = 1 - alfa / 2)) / sqrt(n - 3)))
  o_h <- tanh(z + ((qnorm(p = 1 - alfa / 2)) / sqrt(n - 3)))

  print('Oboustranny IS ----------------------------')
  print(paste('Dolni hranice je: ', round(o_d, dec)))
  print(paste('Holni hranice je: ', round(o_h, dec)))

}
