
#' Welchova aproximace
#'
#' Funkce pro vypocet Welchovy aproximace, vysledek ktere pak muze byt pouzit jako stupne volnosti pro Studentovo rozlozeni.
#
#
#' @param s_1 Smerodatna odchylka prvniho vyberu.
#' @param s_2 Smerodatna odchylka druheho vyberu.
#' @param n_1 Pocet pozorovani v prvnim vyberu.
#' @param n_2 Pocet pozorovani v prvnim vyberu.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Provede vypocet Welchove aproximace (pokud vysledek neni cele cislo, doporucuje se linearni interpolace).
#' @export
welch <- function(s_1, s_2, n_1, n_2, dec = 10){
  v <- (((s_1^2 / n_1) + (s_2^2 / n_2)^2) / ((((s_1^2 / n_1)^2) / (n_1 - 1)) + (((s_2^2 / n_2)^2) / (n_2 - 1))))

  print(paste('Vysledkem Welchovy aproximace je: ', round(v, dec)))

}
