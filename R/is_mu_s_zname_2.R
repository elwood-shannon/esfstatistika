
#' Intervaly spolehlivosti pro \eqn{\mu_1 - \mu_2}, kdyz \eqn{latex}{\sigma_1, \sigma_2} zname
#'
#' Funkce pro vypocet instervalu spolehlivosti rozdilu stredni hodnot \eqn{\mu_1 - \mu_2}, kdyz zname hodnoty smerodatnych odchylek \eqn{\sigma_1, \sigma_2}.
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
is_mu_s_zname_2 <- function(m_1, m_2, s_1, s_2, n_1, n_2, alfa = 0.05, dec = 10){
  o_d <- m_1 - m_2 - ((sqrt((s_1^2 / n_1) + (s_2^2 / n_2))) * qnorm(p = 1 - alfa / 2))
  o_h <- m_1 - m_2 + ((sqrt((s_1^2 / n_1) + (s_2^2 / n_2))) * qnorm(p = 1 - alfa / 2))

  l_d <- m_1 - m_2 - ((sqrt((s_1^2 / n_1) + (s_2^2 / n_2))) * qnorm(p = 1 - alfa))

  p_h <- m_1 - m_2 + ((sqrt((s_1^2 / n_1) + (s_2^2 / n_2))) * qnorm(p = 1 - alfa))

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

