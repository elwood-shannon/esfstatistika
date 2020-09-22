
#' Intervaly spolehlivosti pro regresni parametr \eqn{\beta}
#'
#' Funkce pro vypocet instervalu spolehlivosti regresniho parametru \eqn{\beta}
#
#
#' @param b Odhad parametru beta.
#' @param s Smerodatna odchylka parametru beta.
#' @param n Pocet pozorovani.
#' @param p Pocet parametru v modelu (bez urovonove konstanty).
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita intervaly spolehlivosti pro \eqn{\beta}, oboustranny, levo- a pravostranny.
#' @export
is_beta <- function(b, s, n, p, alfa = 0.05, dec = 10){
  o_d <- b - s * qt(p = 1 - alfa / 2, df = n - p - 1)
  o_h <- b + s * qt(p = 1 - alfa / 2, df = n - p - 1)

  l_d <- b - s * qt(p = 1 - alfa, df = n - p - 1)

  p_h <- b + s * qt(p = 1 - alfa, df = n - p - 1)

  print('Oboustranny IS ----------------------------')
  print(paste('Dolni hranice je: ', round(o_d, dec)))
  print(paste('Holni hranice je: ', round(o_h, dec)))
  print('Levostranny IS ----------------------------')
  print(paste('Dolni hranice je: ', round(l_d, dec)))
  print('Horni hranice je: + nekonecno')
  print('Pravostranny IS ---------------------------')
  print('Dolni hranice je: - nekonecno')
  print(paste('Horni hranice je: ', round(p_h, dec)))

}

