
#' Test o rovnosti dvou korelacnich koeficientu
#'
#' Funkce pro vypocet testovaciho kriteria a kritickych oboru pri testovani rovnosti dvou korelacnich koeficientu.
#
#
#' @param r_1 Vyberovy korelacni koeficient prvniho vyberu.
#' @param r_2 Vyberovy korelacni koeficient druheho vyberu.
#' @param n_1 Pocet pozorovani prvniho vyberu.
#' @param n_2 Pocet pozorovani druheho vyberu.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium testu rovnosti korelacnich koeficientu.
#' @export
rho_test_2 <- function(r_1, r_2, n_1, n_2, alfa = 0.05, dec = 10){
  z <- (1 / 2) * log((1 + r_1) / (1 - r_1))
  z_ast <- (1 / 2) * log((1 + r_2) / (1 - r_2))

  kriterium <- (z - z_ast) / sqrt((1 / (n_1 - 3)) + (1 / (n_2 - 3)))

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
