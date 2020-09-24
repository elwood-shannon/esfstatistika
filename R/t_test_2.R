
#' Dvouvyberovy \eqn{t}-test
#'
#' Funkce pro vypocet testovaciho kriteria a kritickych oboru dvouvyberoveho \eqn{t}-testu.
#
#
#' @param m_1 Stredni hodnota prvniho vyberu.
#' @param m_2 Stredni hodnota druheho vyberu.
#' @param s_1 Smerodatna odchylka prvniho vyberu.
#' @param s_2 Smerodatna odchylka druheho vyberu.
#' @param n_1 Pocet pozorovani prvniho vyberu.
#' @param n_2 Pocet pozorovani druheho vyberu.
#' @param c Konstanta, se kterou se porovnava stredni hodnota vyberu (je 0, pokud neni stanoveho jinak).
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium dvouvyberoveho \eqn{t}-testu.
#' @export
t_test_2 <- function(m_1, m_2, s_1, s_2, n_1, n_2, c = 0, alfa = 0.05, dec = 10){
  s_ast <- sqrt((((n_1 - 1) * s_1^2 + (n_2 - 1) * s_2^2)) / (n_1 + n_2 - 2))

  kriterium <- (m_1 - m_2 - c) / (s_ast * sqrt((1 / n_1) + (1 / n_2)))

  o_h1p <- qt(p = 1 - alfa / 2, df = n_1 + n_2 - 2)
  o_h1n <- -1 * qt(p = 1 - alfa / 2, df = n_1 + n_2 - 2)

  l_h1 <- -1 * qt(p = 1 - alfa, df = n_1 + n_2 - 2)

  p_h1 <- qt(p = 1 - alfa, df = n_1 + n_2 - 2)

  print('Oboustranna H1 -------------------------------------')
  print(paste('W je: (- nekonecno', ',', round(o_h1n, dec), ']', 'u', '[', round(o_h1p, dec), ',',  '+ nekonecno)'))
  print('Levostranna H1 -------------------------------------')
  print(paste('W je: (- nekonecno', ',', round(l_h1, dec), ']'))
  print('Pravostranna H1 ------------------------------------')
  print(paste('W je:', '[', round(p_h1, dec), ',',  '+ nekonecno)'))
  print('----------------------------------------------------')
  print(paste('Testovaci kriterium je: ', round(kriterium, dec)))
}
