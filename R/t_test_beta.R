
#' \eqn{t}-test beta
#'
#' Funkce pro vypocet testovaciho kriteria a kritickych oboru \eqn{t}-testu pro regresni parametr beta.
#
#
#' @param b Odhad parametru beta
#' @param s Smerodatna odchylka parametru beta.
#' @param n Pocet pozorovani.
#' @param p Pocet parametru v modelu (bez urovonove konstanty).
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium \eqn{t}-testu pro parametr beta.
#' @export
t_test_beta <- function(b, s, n, p, alfa = 0.05, dec = 10){
  kriterium <- b / s

  o_h1p <- qt(p = 1 - alfa / 2, df = n - p - 1)
  o_h1n <- -1 * qt(p = 1 - alfa / 2, df = n - p - 1)

  l_h1 <- -1 * qt(p = 1 - alfa, df = n - p - 1)

  p_h1 <- qt(p = 1 - alfa, df = n - p - 1)

  print('Oboustranna H1 -------------------------------------')
  print(paste('W je: (- nekonecno', ',', round(o_h1n, dec), ']', 'u', '[', round(o_h1p, dec), ',',  '+ nekonecno)'))
  print('Levostranna H1 -------------------------------------')
  print(paste('W je: (- nekonecno', ',', round(l_h1, dec), ']'))
  print('Pravostranna H1 ------------------------------------')
  print(paste('W je:', '[', round(p_h1, dec), ',',  '+ nekonecno)'))
  print('----------------------------------------------------')
  print(paste('Testovaci kriterium je: ', round(kriterium, dec)))
}
