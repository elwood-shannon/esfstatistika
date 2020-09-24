
#' \eqn{\rho}-test oproti konstante
#'
#' Funkce pro vypocet testovaciho kriteria a kritickych oboru pri testovani vyznamnosti korelacniho koeficientu (oproti konstante).
#
#
#' @param r Vyberovy korelacni koeficient.
#' @param n Pocet pozorovani.
#' @param c Konstanta, oproti ktere se testuje vyberovy korelacni koeficient.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium testu vyznamnosti korelacniho koeficientu.
#' @export
rho_test_c <- function(r, n, c, alfa = 0.05, dec = 10){
  z <- (1 / 2) * log((1 + r) / (1 - r))

  kriterium <- (z - ((1/2) * log((1 + c) / (1 - c))) - (c / (2 * (n - 1)))) / sqrt(1 / (n - 3))

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
