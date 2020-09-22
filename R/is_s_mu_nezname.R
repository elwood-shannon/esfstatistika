
#' Intervaly spolehlivosti pro \eqn{\sigma^2}, kdyz \eqn{\mu} nezname
#'
#' Funkce pro vypocet instervalu spolehlivosti rozptylu \eqn{\sigma^2}, kdyz nezname hodnotu stredni hodnoty \eqn{\mu}.
#
#
#' @param s Smerodatna odchylka vyberu.
#' @param n Pocet pozorovani.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita intervaly spolehlivosti pro \eqn{\sigma^2}, oboustranny, levo- a pravostranny.
#' @export
is_s_mu_nezname <- function(s, n, alfa = 0.05, dec = 10){
  o_d <- ((n - 1) * s^2) / (qchisq(p = 1 - alfa / 2, df = n - 1))
  o_h <- ((n - 1) * s^2) / (qchisq(p = alfa / 2, df = n - 1))

  l_d <- ((n - 1) * s^2) / (qchisq(p = 1 - alfa, df = n - 1))

  p_h <- ((n - 1) * s^2) / (qchisq(p = alfa, df = n - 1))

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

