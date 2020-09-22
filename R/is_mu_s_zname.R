
#' Intervaly spolehlivosti pro \eqn{\mu}, kdyz \eqn{latex}{\sigma} zname
#'
#' Funkce pro vypocet instervalu spolehlivosti stredni hodnoty \eqn{\mu}, kdyz zname hodnotu smerodatne odchylky \eqn{\sigma}.
#
#
#' @param m Stredni hodnota vyberu.
#' @param s Smerodatna odchylka.
#' @param n Pocet pozorovani.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita intervaly spolehlivosti pro \eqn{\mu}, oboustranny, levo- a pravostranny.
#' @export
is_mu_s_zname <- function(m, s, n, alfa = 0.05, dec = 10){
  o_d <- m - ((s / sqrt(n)) * qnorm(p = 1 - alfa / 2))
  o_h <- m + ((s / sqrt(n)) * qnorm(p = 1 - alfa / 2))

  l_d <- m - ((s / sqrt(n)) * qnorm(p = 1 - alfa))

  p_h <- m + ((s / sqrt(n)) * qnorm(p = 1 - alfa))

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

