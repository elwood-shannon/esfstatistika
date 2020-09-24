
#' Intervaly spolehlivosti pro spolecny neznamy rozptyl \eqn{\sigma^2}
#'
#' Funkce pro vypocet instervalu spolehlivosti spolecneho rozptylu \eqn{\sigma^2}.
#
#
#' @param s_1 Smerodatna odchylka prvniho vyberu.
#' @param s_2 Smerodatna odchylka druheho vyberu
#' @param n_1 Pocet pozorovani prvniho vyberu.
#' @param n_2 Pocet pozorovani druheho vyberu.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita intervaly spolehlivosti pro spolecny rozptyl \eqn{\sigma^2}, oboustranny, levo- a pravostranny.
#' @export
is_s_mu_nezname_2 <- function(s_1, s_2, n_1, n_2, alfa = 0.05, dec = 10){
  s_ast <- (((n_1 - 1) * s_1^2 + (n_2 - 1) * s_2^2)) / (n_1 + n_2 - 2)

  o_d <- ((n_1 + n_2 - 2) * s_ast) / (qchisq(p = 1 - alfa / 2, df = n_1 + n_2 - 2))
  o_h <- ((n_1 + n_2 - 2) * s_ast) / (qchisq(p = alfa / 2, df = n_1 + n_2 - 2))

  l_d <- ((n_1 + n_2 - 2) * s_ast) / (qchisq(p = 1 - alfa, df = n_1 + n_2 - 2))

  p_h <- ((n_1 + n_2 - 2) * s_ast) / (qchisq(p = alfa, df = n_1 + n_2 - 2))

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

