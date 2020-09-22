
#' Intervaly spolehlivosti pro \eqn{\theta} z alternativniho rozlozeni
#'
#' Funkce pro vypocet intervalu spolehlivosti podilu \eqn{\theta}, pokud mame k dispozici data z alternativniho rozlozeni.
#
#
#' @param m Stredni hodnota podilu vyberu.
#' @param n Pocet pozorovani.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita intervaly spolehlivosti pro \eqn{\theta}, oboustranny, levo- a pravostranny.
#' @export
is_theta <- function(m, n, alfa = 0.05, dec = 10){
  if ((n * m * (1 - m)) > 9) {
  o_d <- m - sqrt((m * (1 - m)) / n) * qnorm(p = 1 - alfa / 2)
  o_h <- m + sqrt((m * (1 - m)) / n) * qnorm(p = 1 - alfa / 2)

  l_d <- m - sqrt((m * (1 - m)) / n) * qnorm(p = 1 - alfa)

  p_h <- m + sqrt((m * (1 - m)) / n) * qnorm(p = 1 - alfa)

  print('Oboustranny IS ----------------------------')
  print(paste('Dolni hranice je: ', round(o_d, dec)))
  print(paste('Holni hranice je: ', round(o_h, dec)))
  print('Levostranny IS ----------------------------')
  print(paste('Dolni hranice je: ', round(l_d, dec)))
  print('Horni hranice je: + nekonecno')
  print('Pravostranny IS ---------------------------')
  print('Dolni hranice je: - nekonecno')
  print(paste('Horni hranice je: ', round(p_h, dec)))

  } else {
    print('Podminky aproximace nejsou splneny.')
  }
}

