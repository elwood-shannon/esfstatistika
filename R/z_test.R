
#' \eqn{z}-test
#'
#' Funkce pro vypocet testovaciho kriteria a kritickych oboru \eqn{z}-testu.
#
#
#' @param m Stredni hodnota vyberu.
#' @param s Smerodatna odchylka.
#' @param n Pocet pozorovani.
#' @param c Konstanta, se kterou se porovnava stredni hodnota vyberu (je 0, pokud neni stanoveno jinak).
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium \eqn{z}-testu.
#' @export
z_test <- function(m, s, n, c = 0, alfa = 0.05, dec = 10){
  kriterium <- (m - c) / (s / sqrt(n))

  o_h1p <- qnorm(p = 1 - alfa / 2)
  o_h1n <- -1 * qnorm(p = 1 - alfa / 2)

  l_h1 <- -1 * qnorm(p = 1 - alfa)

  p_h1 <- qnorm(p = 1 - alfa)

  print('Oboustranna H1 -------------------------------------')
  print(paste('W je: (- nekonecno', ',', round(o_h1n, dec), ']', 'u', '[', round(o_h1p, dec), ',',  '+ nekonecno)'))
  print('Levostranna H1 -------------------------------------')
  print(paste('W je: (- nekonecno', ',', round(l_h1, dec), ']'))
  print('Pravostranna H1 ------------------------------------')
  print(paste('W je:', '[', round(p_h1, dec), ',',  '+ nekonecno)'))
  print('----------------------------------------------------')
  print(paste('Testovaci kriterium je: ', round(kriterium, dec)))
}
