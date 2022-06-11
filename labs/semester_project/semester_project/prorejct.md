Generování PWM signálu s nastavitelnou střídou
Team members
Filip Seč
...
Table of contents
Project objectives
Hardware description
VHDL modules description and simulations
TOP module description and simulations
Video
References

Project objectives
Vytvorenie implementácie generátora PWM signálu vo VHDL. 
Nastavenie frekvencie PWM signálu na 2 kHz.
Vyvedenie signálu na rozšiřující konektor na doske, kde se bude neustále generovať obdlžnikový signál s duty cycle podla aktuálnej kombinacie prepínačov.

Hardware description
Nexys A7-50T
Artix-7 je optimalizovaný pre vysoko výkonnú logiku. Vďaka veľkej, vysokokapacitnej FPGA a kolekcii portov USB, Ethernet a ďalších portov môže Nexys A7 
hostiť návrhy od úvodných kombinačných obvodov až po výkonné vstavané procesory. Niekoľko zabudovaných periférií vrátane akcelerometra, teplotného snímača, 
digitálneho mikrofónu MEMs, zosilňovača reproduktorov a množstva vstupno-výstupných zariadení umožňuje používať Nexys A7 pre širokú škálu návrhov 
bez potreby ďalších komponentov. 



VHDL modules description and simulations

1. Jadro generátora PWM implementuje funkciu Pulse Width Modulation (PWM) so základnou frekvenciou (𝑓𝑃𝑊𝑀). Existujú
dva konfigurovateľné parametre, ktoré spolu definujú základnú frekvenciu: 1. frekvencia vstupného signálu clk_en. Tento signál sa používa ako presca vstupných hodín IP Core („clk“)Musíme sa rozhodnút, aká bude základná frekvencia impulzov. Nastaviť ju na generátore clk alebo predpokladať, že je to jednoducho frekvencia prichádzajúca z  externého zdroja na clk pin.
2.Potom musíme zistiť aká bude maximálna perióda daného výstupného impulzu. Definujeme  register counteru s dostatočným počtom bitov (v našom prípade je to 8).
3. Zadefinujeme šírku impulzu s rovnakou šírkou, ktorá definuje počet vstupných clk, pri ktorých sa výstupný impulz prepne z 1 späť na nulu.
 Potom zadefinujeme výstupný signál PWM ako 1 vždy, keď je hodnota counteru menšia ako hodnota registra šírky impulzu. Nula vo všetkých ostatných prípadoch.
4.Následne vytvoríme súbor vo vhdl s 3 modulmi: clock enable, pwm generator a top. K top modulu ešťe dorobíme testbench.

Modul PWM GENERATOR


Náš Pwm modul implementuje 2 porty na vstupe a jeden port na výstupe. 
Posledným signálom na entite je pwm_out. To je riadiaci signál modulovaný PWM, ktorý smerujete na pin FPGA.


umožnuje určiť 2 konštanty v čase. Vďaka tomu môžeme prispôsobiť modul. Prvé dva signály sú clk a duty.
Prvý z nich, s názvom pwm_bits, určuje dĺžku counteru. Táto konštanta nastavuje dĺžku bitov. Umožnuje nám to nastaviť rozsah frekvencie PWM, ktorý bude dobre fungpvať.

Druhá generic konštanta má názov clk_cnt_len. Určuje dĺžku druhého counteru, ktorý účinne znižuje frekvenciu PWM. Funguje ako clock divider.

Tretí vstup je duty cycle. Dĺžka signálu duty_cycle sa riadi generic konštantou pwm_bits. 
Konštanta pwm_bits riadi, napájanie analógového zariadenia.
Posledným signálom na entite je pwm_out. To je riadiaci signál modulovaný PWM, ktorý smerujete na pin FPGA.


Modul PWM internal signálov

Modul PWM obsahuje iba dva interné signály. Prvým je counter PWM, ktorý je totožný so vstupom duty cycle. 
Rovnako ako v druhom prípade, konštanta pwm_bits určuje aj dĺžku tohto signálu.


PWM clock cycle counter process

Ak modul nie je v resete, logika bude počítať clock cycles nepretržite a pri maximálnej hodnote sa vráti na nulu.


Výstup PWM

Proces, ktorý nastavuje výstupný signál PWM, riadi aj counter PWM. Inkrementuje čítač PWM, keď je hodnota čítača hodinových cyklov 0. 
Takto funguje mechanizmus obmedzovania frekvencie PWM.


TOP module description and simulations



Video
Write your text here


References
Write your text here.
