
#' Test o rozptylu
#'
#' Funkce pro vypocet testovaciho kriteria a kritickych oboru testu o rozptylu.
#
#
#' @param s_2 Rozptyl vyberu.
#' @param n Pocet pozorovani.
#' @param c Konstanta, se kterou se porovnava rozptyl vyberu.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium testu o rozptylu.
#' @export
rozptyl_test <- function(s_2, n, c, alfa = 0.05, dec = 10){
  kriterium <- ((n - 1) * s_2) / c

  o_h1p <- qchisq(p = alfa / 2, df = n - 1)
  o_h1n <- qchisq(p = 1 - alfa / 2, df = n - 1)

  l_h1 <- qchisq(p = alfa, df = n - 1)

  p_h1 <- qchisq(p = 1 - alfa, df = n - 1)

  print('Oboustranna H1 -------------------------------------')
  print(paste('W je: (0', ',', round(o_h1p, dec), ']', 'u', '[', round(o_h1n, dec), ',',  '+ nekonecno)'))
  print('Levostranna H1 -------------------------------------')
  print(paste('W je: (0', ',', round(l_h1, dec), ']'))
  print('Pravostranna H1 ------------------------------------')
  print(paste('W je:', '[', round(p_h1, dec), ',',  '+ nekonecno)'))
  print('----------------------------------------------------')
  print(paste('Testovaci kriterium je: ', round(kriterium, dec)))
}
