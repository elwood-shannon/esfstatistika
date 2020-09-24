
#' Intervaly spolehlivosti pro \eqn{\mu_1 - \mu_2}, kdyz \eqn{latex}{\sigma_1, \sigma_2} nezname
#'
#' Funkce pro vypocet instervalu spolehlivosti rozdilu stredni hodnot \eqn{\mu_1 - \mu_2}, kdyz nezname hodnoty smerodatnych odchylek \eqn{\sigma_1, \sigma_2}, ale vime, ze jsou shodne.
#
#
#' @param m_1 Stredni hodnota prvniho vyberu.
#' @param m_2 Stredni hodnota druheho vyberu.
#' @param s_1 Smerodatna odchylka prvniho vyberu.
#' @param s_2 Smerodatna odchylka druheho vyberu.
#' @param n_1 Pocet pozorovani v prvnim vyberu.
#' @param n_2 Pocet pozorovani v prvnim vyberu.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita intervaly spolehlivosti pro rozdil \eqn{\mu_1 - \mu_2}, oboustranny, levo- a pravostranny.
#' @export
is_mu_s_nezname_2 <- function(m_1, m_2, s_1, s_2, n_1, n_2, alfa = 0.05, dec = 10){
  s_ast <- sqrt((((n_1 - 1) * s_1^2 + (n_2 - 1) * s_2^2)) / (n_1 + n_2 - 2))

  o_d <- m_1 - m_2 - (s_ast * (sqrt((1 / n_1) + (1 / n_2))) * qt(p = 1 - alfa / 2, df = n_1 + n_2 - 2))
  o_h <- m_1 - m_2 + (s_ast * (sqrt((1 / n_1) + (1 / n_2))) * qt(p = 1 - alfa / 2, df = n_1 + n_2 - 2))

  l_d <- m_1 - m_2 - (s_ast * (sqrt((1 / n_1) + (1 / n_2))) * qt(p = 1 - alfa, df = n_1 + n_2 - 2))

  p_h <- m_1 - m_2 + (s_ast * (sqrt((1 / n_1) + (1 / n_2))) * qt(p = 1 - alfa, df = n_1 + n_2 - 2))

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

