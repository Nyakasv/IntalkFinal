Az oldal jsp és servlet használatával készült, a desing az semmilyen, mert nem volt cél.
Nincs minden funkció leimplementálva!
Kicsit MVC szerû lenne az oldal csak az M kimaradt, vannak controllerek(servlet) és view-k(jsp).

Derby adatbázist használ az adatbázis bele van másolva a project fõ könyvtárába.
DBnév: Intalk
user: viktorakossanyi
pw: Intalk123
Ez a kódból is megtekinthetõ!

Fõbb funkciók Regisztráció, Login, Jelszó változtatás, 2 játék, játékpénz vásárlás.

Az adatbázis csak 1 táblából és oszlopból áll, nincs id, mivel a Derby nem igazán szereti az INCREMENT utasítás.
Eredetileg azureSql lett volna, de mivel mindenhol be kellene állítani a CLASSPATH-t, ami a jdbc-re mutat errõl lemondtunk. A sulis gépen valószínûleg nem is tudnánk hozzá nyúlni a környezeti változókhoz. A töbi megoldás pedig idõigényel lett volna (Maven,stb)
