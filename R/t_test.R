
#' \eqn{t}-test
#'
#' Funkce pro vypocet testovaciho kriteria a kritickych oboru \eqn{t}-testu.
#
#
#' @param m Stredni hodnota vyberu.
#' @param s Smerodatna odchylka vyberu.
#' @param n Pocet pozorovani.
#' @param c Konstanta, se kterou se porovnava stredni hodnota vyberu.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium \eqn{t}-testu.
#' @export
t_test <- function(m, s, n, c, alfa = 0.05, dec = 10){
  kriterium <- (m - c) / (s / sqrt(n))

  o_h1p <- qt(p = 1 - alfa / 2, df = n - 1)
  o_h1n <- -1 * qt(p = 1 - alfa / 2, df = n - 1)

  l_h1 <- -1 * qt(p = 1 - alfa, df = n - 1)

  p_h1 <- qt(p = 1 - alfa, df = n - 1)

  print('Oboustranna H1 -------------------------------------')
  print(paste('W je: (- nekonecno', ',', round(o_h1n, dec), ']', 'u', '[', round(o_h1p, dec), ',',  '+ nekonecno)'))
  print('Levostranna H1 -------------------------------------')
  print(paste('W je: (- nekonecno', ',', round(l_h1, dec), ']'))
  print('Pravostranna H1 ------------------------------------')
  print(paste('W je:', '[', round(p_h1, dec), ',',  '+ nekonecno)'))
  print('----------------------------------------------------')
  print(paste('Testovaci kriterium je: ', round(kriterium, dec)))
}
