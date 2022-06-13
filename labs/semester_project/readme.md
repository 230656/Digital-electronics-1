## Project objectives

Cieľom semestrálneho projektu je vytvorenie implementácie generátora PWM signálus s nastavitelnou střídou vo VHDL. Implementácia je splnená v nasledujúcich bodoch: 
1. Nastavenie základnej frekvencie impulzov (2kHz) pomocou modulu clock enable. Násladné privedenie signálu na osciloskop.
2. Rozhodnutie, aká bude maximálna perióda daného výstupu pulzu (duty(%)).
3. Zadefinovanie counter registru s dostatočným počtom bitov (256 kombinacií nastavitelných pomocou prepínačov na doske) na počítanie danej dĺžky času s tým, že sa inkrementuje raz za vstup clocku.
4. Zadefinovanie rovnakej šírky impulzu registru, s akou sme zadefinovali vstupný clock count. To nám pomôže zmeniť výstupný pulz z jednotky na nulu. 
5. Posledným krokom je zadefinovanie výstupného PWM signálu ako jedna, keď  bude hodnota counteru menšia ako hodnota šírky pulzu registru a nula vo všetkých ostatných prípadoch. 

<a name="Nexys A7-50T"></a>

## Popis Hardwaru

 ![your figure](images/nexys_a7.png)

Artix-7 je optimalizovaný pre vysoko výkonnú logiku. Vďaka veľkej, vysokokapacitnej FPGA a kolekcii portov USB, Ethernet a ďalších portov môže Nexys A7 
hostiť návrhy od úvodných kombinačných obvodov až po výkonné vstavané procesory. Niekoľko zabudovaných periférií vrátane akcelerometra, teplotného snímača, 
digitálneho mikrofónu MEMs, zosilňovača reproduktorov a množstva vstupno-výstupných zariadení umožňuje používať Nexys A7 pre širokú škálu návrhov 
bez potreby ďalších komponentov. 

<a name="Popis a simulácia modulov napísaných v jazyku VHDL"></a>

## VHDL modules description and simulations



<a name="top"></a>

## TOP module description and simulations

Write your text here.

<a name="video"></a>

## Video

Write your text here

<a name="references"></a>

## References

1. Write your text here.
