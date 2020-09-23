# esfstatistika

Tento balíček byl vytvořen pro pomoc při studiu výhradně studentům kurzů statistiky na Ekonomicko-správní fakultě Masarykovy univerzity. Obsahuje několik funkcí, které zjednodušují výpočet základních intervalů spolehlivostí a testovacích kritérií.

## Instalace balíčku

1. Otevřete si R-Studio.
2. Do konzole zadejte příkaz `devtools::install_github("elwood-shannon/esfstatistika")`. Po následné instalaci by Vám měly být přístupné všechny funkce, obsažené v balíčku.

## Práce s funkcemi (pokud nemáte čas, můžete přeskočit)

Funkce obsažené v balíčku pokryvají většinu kurzu **Statistika 2**. Postupně budou přibývat i další. Názvy funkcí jsou více méně intuitivní, a řídí se jednoduchými pravidly:

1. Funkce, která počítá jakýkoliv interval spolehlivosti, začíná na `is_`.
2. Dále následuje parametr, pro který interval spolehlivosti vytvaříme, např. `_mu_` (pro střední hodnotu).
3. Dále následuje parametr, který buď máme nebo nemáme k dispozici, např. `_s_` (skutečná směrodatná odchylku).
4. Končí název funkce slovem `_zname` nebo `_nezname` na základě toho, zdá známe nebo neznáme parametr zmíněný v bodě 3.
5. Pokud máme k dispozici dva výběry (a testujeme statistiky na základě dvou výběrů), přidáváme na konci `_2`.
Tak například, funkce pro výpočet intervalu spolehlivosti pro rozdíl středních hodnot dvou výběru při neznámých směrodatných odchylkách je `is_mu_s_nezname_2`.
5. Funkce, která počítá jakýkoliv kritický obor a statistiku začíná buď příslušným názvem testu (např. `f_test`), nebo parametrem, který se testuje např. (`theta_`).
6. Popis jednotlivých parametrů si najdete v dokumentaci každé příslušné funkce (stačí zadat do R konzole příkaz `?nazev_funkce`).

Seznam všech funkcí s příslušnými kapitolami přednášek, kam patří, jsou uvedene níže.

## Seznam funkcí

Funkce jsou tříděné dle příslušných přednášek (dle studijních materiálů **Statistiky 2**). Vedle názvu každé funkce následuje stručný popis a možnost použití.

### 5. Parametrické úlohy o jednom náhodném výběru z normálního rozložení

Název funkce | Použití
------------ | -------------
`is_mu_s_zname` | Interval spolehlivosti pro parametr **μ**, když **σ^2** známe
`is_s_mu_nezname` | Interval spolehlivosti pro **σ^2**, když **μ** neznáme
`is_mu_s_nezname` | Interval spolehlivosti pro **μ**, když **σ^2** neznáme 
`z_test` | Testování **μ** oproti konstantě **c**, když **σ^2** známe
`t_test` |Testování **μ** oproti konstantě **c**, když **σ^2** neznáme
`rozptyl_test` | Testování **σ^2** oproti konstantě **c**, když **μ** neznáme

### 6. Parametrické úlohy o dvou nezávislých náhodných výběrech z normálního rozložení

Název funkce | Použití
------------ | -------------
`is_mu_s_zname_2` | Interval spolehlivosti pro **μ_1 - μ_2**, když **σ_1^2, σ_2^2** známe
`is_s_mu_nezname_2` | Interval spolehlivosti pro společný neznámý rozptyl **σ^2**
`is_mu_s_nezname_2` | Interval spolehlivosti pro **μ_1 - μ_2**, když **σ_1^2, σ_2^2** neznáme
`is_s_podil_2` | Interval spolehlivosti pro podíl rozptylů **σ_1^2 /σ_2^2**
`welch` | Welchova aproximace
`z_test_2` | Dvouvýbérový *z*-test o shodě dvou středních hodnot
`t_test_2` | Dvouvýběrový *t*-test o shodě dvou středních hodnot
`f_test` | *F*-test o shodě dvou rozptylů

### 7. Parametrické úlohy o jednom a dvou nezávislých náhodných výběrech z alternativního rozložení

Název funkce | Použití
------------ | -------------
`is_theta` | Interval spolehlivosti pro parametr **υ** z alternativního rozložení
`theta_test` | Testování parametru **υ** oproti konstantě **c**. Do funkce je implementováno ověření podmínky dobré aproximace
`is_theta_2` | Interval spolehlivosti pro rozdil **υ_1 - υ_2** z alternativního rozložení
`theta_test_2` | Testování rozdilu **υ_1 - υ_2** oproti konstantě **c**. Do funkce je implementováno ověření podmínky dobré aproximace. Pokud **c** je rovno nule, přednostně se použivá speciální vztah (viz přednáška)

### 9. Jednoduchá lineární regrese

Název funkce | Použití
------------ | -------------
`is_beta` | Interval spolehlivosti pro regresní parametr **β**
`t_test_beta` | Testování významnosti regresního parametru **β**

### 10. Úvod do korelační analýzy

Název funkce | Použití
------------ | -------------
`rho_test_0` | Testování parametru **ρ** korelačního koeficientu oproti nule
`rho_test_c` | Testování parametru **ρ** korelačního koeficientu oproti konstantě **c**
`is_rho` | Interval spolehlivosti pro parametr **ρ**
`rho_test_2` | Testování rovnosti dvou korelačních koeficientu **ρ_1** a **ρ_2**

## Příklad použití

**(Příklad je převzat z 6. přednášky)** Ve dvou nádržích se zkoumal obsah chlóru (v g/l). Z první nádrže bylo odebráno 25 vzorků, z druhé nádrže 10 vzorků. Byly vypočteny realizace výběrových průměrů a rozptylů: **m_1** = 34.48, **m_2** = 35.59, **s_1^2** = 1.7482, **s_2^2** = 1.7121. Sestrojte 95% empirický interval spolehlivosti pro rozdíl středních hodnot **μ_1 - μ_2**. 

**Řešení**: v tomto případě se hodí funkce `is_mu_s_nezname_2(m_1, m_2, s_1, s_1, n_1, n_2, alfa = 0.05, dec = 10)`. Místo argumentů dosadíme čísla, které máme k dispozici: `is_mu_s_nezname_2(34.48, 35.59, sqrt(1.7482), sqrt(1.7121), 25, 10, alfa = 0.05, dec = 4)`. Následně se zobrazí všechny potřebné údaje (viz obrázek).

![Příklad použití](https://github.com/elwood-shannon/esfstatistika/blob/master/screen.jpg)









