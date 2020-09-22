
#' Intervaly spolehlivosti pro rozdil parametru \eqn{\theta_1 - \theta_2}
#'
#' Funkce pro vypocet instervalu spolehlivosti pro rozdil parametru \eqn{\theta_1 - \theta_2}.
#
#
#' @param m_1 Stredni hodnota podilu prvniho vyberu.
#' @param m_2 Stredni hodnota podilu druheho vyberu.
#' @param n_1 Pocet pozorovani prvniho vyberu.
#' @param n_2 Pocet pozorovani druheho vyberu.
#' @param alfa Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).
#' @param dec Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).
#' @return Vypocita kriticke obory a testovaci kriterium pro testovani parametru \eqn{\theta}.
#' @export
is_theta_2 <- function(m_1, m_2, n_1, n_2, alfa = 0.05, dec = 10){
  if (((n_1 * m_1 * (1 - m_1)) > 9) & (n_2 * m_2 * (1 - m_2) > 9)) {
    o_d <- m_1 - m_2 - (sqrt(((m_1 * (1 - m_1)) / n_1) + ((m_2 * (1 - m_2)) / n_2))) * qnorm(p = 1 - alfa / 2)
    o_h <- m_1 - m_2 + (sqrt(((m_1 * (1 - m_1)) / n_1) + ((m_2 * (1 - m_2)) / n_2))) * qnorm(p = 1 - alfa / 2)

    l_d <- m_1 - m_2 - (sqrt(((m_1 * (1 - m_1)) / n_1) + ((m_2 * (1 - m_2)) / n_2))) * qnorm(p = 1 - alfa)

    p_h <- m_1 - m_2 + (sqrt(((m_1 * (1 - m_1)) / n_1) + ((m_2 * (1 - m_2)) / n_2))) * qnorm(p = 1 - alfa)

    print('Oboustranny IS ----------------------------')
    print(paste('Dolni hranice je: ', round(o_d, dec)))
    print(paste('Holni hranice je: ', round(o_h, dec)))
    print('Levostranny IS ----------------------------')
    print(paste('Dolni hranice je: ', round(l_d, dec)))
    print('Horni hranice je: + nekonecno')
    print('Pravostranny IS ---------------------------')
    print('Dolni hranice je: - nekonecno')
    print(paste('Horni hranice je: ', round(p_h, dec)))

  } else {
    print('Podminky aproximace nejsou splneny.')
  }
}
