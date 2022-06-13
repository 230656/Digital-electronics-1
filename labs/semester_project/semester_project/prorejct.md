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


Modul PWM entity

Generic port umožnuje určiť 2 konštanty v čase. Vďaka tomu môžeme prispôsobiť modul.
Prvý z nich, s názvom pwm_bits, určuje dĺžku counteru. Táto konštanta nastavuje dĺžku bitov. Umožnuje nám to nastaviť rozsah frekvencie PWM, ktorý bude dobre fungpvať.

Druhá generic konštanta má názov clk_cnt_len. Určuje dĺžku druhého counteru, ktorý účinne znižuje frekvenciu PWM. Funguje ako clock divider.

Prvé dva signály sú clk a rst.
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