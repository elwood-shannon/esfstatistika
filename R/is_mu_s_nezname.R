
#' Intervaly spolehlivosti pro \eqn{\mu}, kdyz \eqn{\sigma^2} nezname
#'
#' Funkce pro vypocet instervalu spolehlivosti stredni hodnoty \eqn{\mu}, kdyz nezname hodnotu smerodatne odchylky \eqn{\sigma^2}.
#
#
#' @param m Stredni hodnota vyberu.
#' @param s Smerodatna odchylka vyberu.
#' @param n Pocet pozorovani.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita intervaly spolehlivosti pro \eqn{\mu}, oboustranny, levo- a pravostranny.
#' @export
is_mu_s_nezname <- function(m, s, n, alfa = 0.05, dec = 10){
  o_d <- m - ((s / sqrt(n)) * qt(p = 1 - alfa / 2, df = n - 1))
  o_h <- m + ((s / sqrt(n)) * qt(p = 1 - alfa / 2, df = n - 1))

  l_d <- m - ((s / sqrt(n)) * qt(p = 1 - alfa, df = n - 1))

  p_h <- m + ((s / sqrt(n)) * qt(p = 1 - alfa, df = n - 1))

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

