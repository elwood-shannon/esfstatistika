% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theta_test.R
\name{theta_test}
\alias{theta_test}
\title{Testovani parametru \eqn{\theta} z alternativniho rozlozeni}
\usage{
theta_test(m, n, c, alfa = 0.05, dec = 10)
}
\arguments{
\item{m}{Stredni hodnota podilu vyberu.}

\item{n}{Pocet pozorovani.}

\item{alfa}{Hladina vyznamnosti (je 0.05, pokud neni stanoveno jinak).}

\item{dec}{Pocet desetinnych mist v konecnem vysledku (je 10, pokud neni stanoveno jinak).}
}
\value{
Vypocita kriticke obory a testovaci kriterium pro testovani parametru \eqn{\theta}.
}
\description{
Funkce pro vypocet testovaciho kriteria a kritickych oboru parametru \eqn{\theta}.
}
