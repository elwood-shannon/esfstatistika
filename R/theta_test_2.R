
#' Testovani parametru \eqn{\theta} z alternativniho rozlozeni
#'
#' Funkce pro vypocet testovaciho kriteria a kritickych oboru rozdilu parametru \eqn{\theta_1 - \theta_2}.
#
#
#' @param m Stredni hodnota podilu vyberu.
#' @param n Pocet pozorovani.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium pro testovani parametru \eqn{\theta}.
#' @export
theta_test_2 <- function(m_1, m_2, n_1, n_2, c = 0, alfa = 0.05, dec = 10){
  if (((n_1 * m_1 * (1 - m_1)) > 9) & (n_2 * m_2 * (1 - m_2) > 9)) {
    if (c != 0) {
      kriterium <- (m_1 - m_2 - c) / sqrt(((m_1 * (1 - m_1)) / n_1) + ((m_2 * (1 - m_2)) / n_2))
    } else {
      m_ast <- (n_1 * m_1 + n_2 * m_2) / (n_1 + n_2)

      kriterium <- (m_1 - m_2) / sqrt(m_ast * (1 - m_ast) * ((1 / n_1) + (1 / n_2)))
    }

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

  } else {
    print('Podminky aproximace nejsou splneny.')
  }

}
