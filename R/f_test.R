
#' \eqn{F}-test
#'
#' Funkce pro vypocet testovaciho kriteria a kritickych oboru \eqn{F}-testu.
#
#
#' @param s_1 Smerodatna odchylka prvniho vyberu.
#' @param s_2 Smerodatna odchylka druheho vyberu.
#' @param n_1 Pocet pozorovani prvniho vyberu.
#' @param n_2 Pocet pozorovani druheho vyberu.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium dvouvyberoveho \eqn{F}-testu.
#' @export
f_test <- function(s_1, s_2, n_1, n_2, alfa = 0.05, dec = 10){
  kriterium <- s_1^2 / s_2^2

  o_h1p <- qf(p = 1 - alfa / 2, df1 = n_1 - 1, df2 = n_2 - 1)
  o_h1n <- qf(p = alfa / 2, df1 = n_1 - 1, df2 = n_2 - 1)

  l_h1 <- qf(p = alfa, df1 = n_1 - 1, df2 = n_2 - 1)

  p_h1 <- qf(p = 1 - alfa, df1 = n_1 - 1, df2 = n_2 - 1)

  print('Oboustranna H1 -------------------------------------')
  print(paste('W je: (0', ',', round(o_h1n, dec), ']', 'u', '[', round(o_h1p, dec), ',',  '+ nekonecno)'))
  print('Levostranna H1 -------------------------------------')
  print(paste('W je: (0', ',', round(l_h1, dec), ']'))
  print('Pravostranna H1 ------------------------------------')
  print(paste('W je:', '[', round(p_h1, dec), ',',  '+ nekonecno)'))
  print('----------------------------------------------------')
  print(paste('Testovaci kriterium je: ', round(kriterium, dec)))
}
