Az oldal jsp �s servlet haszn�lat�val k�sz�lt, a desing az semmilyen, mert nem volt c�l.
Nincs minden funkci� leimplement�lva!
Kicsit MVC szer� lenne az oldal csak az M kimaradt, vannak controllerek(servlet) �s view-k(jsp).

Derby adatb�zist haszn�l az adatb�zis bele van m�solva a project f� k�nyvt�r�ba.
DBn�v: Intalk
user: viktorakossanyi
pw: Intalk123
Ez a k�db�l is megtekinthet�!

F�bb funkci�k Regisztr�ci�, Login, Jelsz� v�ltoztat�s, 2 j�t�k, j�t�kp�nz v�s�rl�s.

Az adatb�zis csak 1 t�bl�b�l �s oszlopb�l �ll, nincs id, mivel a Derby nem igaz�n szereti az INCREMENT utas�t�s.
Eredetileg azureSql lett volna, de mivel mindenhol be kellene �ll�tani a CLASSPATH-t, ami a jdbc-re mutat err�l lemondtunk. A sulis g�pen val�sz�n�leg nem is tudn�nk hozz� ny�lni a k�rnyezeti v�ltoz�khoz. A t�bi megold�s pedig id�ig�nyel lett volna (Maven,stb)
