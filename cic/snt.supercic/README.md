SuperCIC-lock for Analogue Super NT
=======

Programming the SuperCIC in the SuperNT
---

The programming header you have to use is J7.

Connect your programmer of your choice as given in the table below.

Power your SuperNT and Reflash the SuperCIC-lock with th pre-compiled hex-file. 

Pinout
---

| **Pin @ J7** | **Signal** | **Pin @ PICKit** |
|:------------:|:----------:|:----------------:|
| 1 | Vpp/MCLR  | 1 |
| 2 | ICSPCLK | 5 |
| 3 | ICSPDAT | 4 |
| 4 | GND | 3 |
| 5 | Vcc | 2 |


(Pin 1 is at the outer left side if the controller ports facing you)