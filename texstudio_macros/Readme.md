# Makros für TexStudio

Enthält Makros für schnelleres Arbeiten in TexStudio.



## Wie bringe ich die Makros in mein Setup?

Kopieren der Dateien nach

```sh
# Windows
C:/Users/${Benutzername}/Roaming/texstudio/macro
# Unix
~/.config/texstudio/macro
```

## Wie verwende ich sie?

### Zeilenweise Kopieren, Ausschneiden

Ist nichts markiert, wird die ganze Zeile kopiert/ausgeschnitten (mit Strg+C/X).

### Schnelles einfügen:

```tex
% ins TeX-Dokument schreiben (in TexStudio)
<<fig % wird automatisch zu einer figure-Umgebung ergänzt
<<tikz
<<itm % Bullet-point-Liste (Strg+Umschalt+i für neuen Bullet Point)

% Paste von Tabellendaten aus der Zwischenablage. 
% Das Format in der Zwischenablage sollte CSV sein (Werte durch Komma oder Tab getrennt, neue Zeile druch Umbruch)
% Die Formatierung wird in Latex umgewandelt.
% Besonders praktisch mit Format "S" (satt c, l oder r) und Paket "siunitx" -> die Zahlen werden beim Kompilieren einheitlich gerundet und formatiert.
% Beispiel:
<<tblpaste 

%führt zu
\begin{tabular}{lll} % hier l durch S ersetzen für Autoformatierung
Legende 1 & 1.23234 & 1.23454 \\
Legende 2 & 3.1415  & 1.08E+9 \\
\end{tabular}

```