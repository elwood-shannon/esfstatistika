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

