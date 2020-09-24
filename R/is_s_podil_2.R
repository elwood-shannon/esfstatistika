
#' Intervaly spolehlivosti pro podil rozptylu \eqn{\sigma_1^2 / \sigma_2^2}
#'
#' Funkce pro vypocet intervalu spolehlivosti pro podil rozptylu \eqn{\sigma_1^2 / \sigma_2^2}.
#
#
#' @param s_1 Smerodatna odchylka prvniho vyberu.
#' @param s_2 Smerodatna odchylka druheho vyberu.
#' @param n_1 Pocet pozorovani v prvnim vyberu.
#' @param n_2 Pocet pozorovani v prvnim vyberu.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita intervaly spolehlivosti pro podil rozptylu \eqn{\sigma_1^2 / \sigma_2^2}, oboustranny, levo- a pravostranny.
#' @export
is_s_podil_2 <- function(s_1, s_2, n_1, n_2, alfa = 0.05, dec = 10){
  o_d <- (s_1^2 / s_2^2) / qf(p = 1 - alfa / 2, df1 = n_1 - 1, df2 = n_2 - 1)
  o_h <- (s_1^2 / s_2^2) / qf(p = alfa / 2, df1 = n_1 - 1, df2 = n_2 - 1)

  l_d <- (s_1^2 / s_2^2) / qf(p = 1 - alfa, df1 = n_1 - 1, df2 = n_2 - 1)

  p_h <- (s_1^2 / s_2^2) / qf(p = alfa, df1 = n_1 - 1, df2 = n_2 - 1)

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

