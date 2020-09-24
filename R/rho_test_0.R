
#' \eqn{\rho}-test oproti 0
#'
#' Funkce pro vypocet testovaciho kriteria a kritickych oboru pri testovani vyznamnosti korelacniho koeficientu (oproti nule).
#
#
#' @param r Vyberovy korelacni koeficient.
#' @param n Pocet pozorovani.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium testu vyznamnosti korelacniho koeficientu.
#' @export
rho_test_0 <- function(r, n, alfa = 0.05, dec = 10){
  kriterium <- (r * sqrt(n - 2)) / (sqrt(1 - r^2))

  o_h1p <- qt(p = 1 - alfa / 2, df = n - 2)
  o_h1n <- -1 * qt(p = 1 - alfa / 2, df = n - 2)

  l_h1 <- -1 * qt(p = 1 - alfa, df = n - 2)

  p_h1 <- qt(p = 1 - alfa, df = n - 2)

  print('Oboustranna H1 -------------------------------------')
  print(paste('W je: (- nekonecno', ',', round(o_h1n, dec), ']', 'u', '[', round(o_h1p, dec), ',',  '+ nekonecno)'))
  print('Levostranna H1 -------------------------------------')
  print(paste('W je: (- nekonecno', ',', round(l_h1, dec), ']'))
  print('Pravostranna H1 ------------------------------------')
  print(paste('W je:', '[', round(p_h1, dec), ',',  '+ nekonecno)'))
  print('----------------------------------------------------')
  print(paste('Testovaci kriterium je: ', round(kriterium, dec)))
}
