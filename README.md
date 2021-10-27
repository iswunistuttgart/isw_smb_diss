# iswipads

LaTeX Style für Dissertationen am ISW


## Anleitung zum Aufsetzen meiner Dissertation 

### Weg 1: Als git submodule (ohne Overleaf)

**Vorteil:**

- Modular eingebunden
- Updates einfach über git

**Nachteil:**

- Geht nicht mit Ovelreaf (Unterstützt keine git submodules)

**Howto:**

1. Anlegen eines Diss-Ordners als Git-Repository
2. Einbinden dieses Repositories als Git-Submodul

    ```sh
    # git Kommandozeile
    # über https (meistens einfacher)
    git submodule add https://git.isw.uni-stuttgart.de/projekte/eigenentwicklungen/templates/iswipads.git
    # oder über ssh (SSH-Key muss eingerichtet sein)
    git submodule add git@git.isw.uni-stuttgart.de:projekte/eigenentwicklungen/templates/iswipads.git
    ```

3. Als Gerüst zur Strukturierung der Diss kann `diss_beispiel.tex` aus dem Submodul/Unterordner `iswipads` in den eigenen Ordner kopiert werden.
4. Spätere Updates der Klasse über

    ```
    git submodule update --remote
    ```


### Weg 2: Mit Overleaf

**Vorteil:**

- Lässt sich in Overleaf nutzen
- Das Diss-Verzeichnis kann trotzdem in Git eingecheckt werden, nur die Verbindung zur Klasse geht verloren

**Nachteil:**

- Updates in der Klasse müssen von Hand heruntergeladen werden (oder über [Gitlab API, z.B. mit curl](https://stackoverflow.com/questions/44730632/gitlab-api-how-to-get-the-repository-project-files-and-metadata))

**Howto:**

1. Repository auschecken oder downloaden und folgende Dateien in den Ordner `iswipads/` im eigenen Dissertationsverzeichnis kopieren:

    ```
    ipa-authoryear.cbx  iswipads.cls    ipa-authoryear.bbx  iswipadsbib.sty     iswipadsgloss.sty
    ```
2. Als Gerüst zur Strukturierung der Diss kann `diss_beispiel.tex` in den eigenen Ordner kopiert werden.
3. Spätere Updates müssen wie in Schritt 1. erfolgen

## Struktur

- `iswipads.cls` ... Klasse, die das generelle Styling festlegt und das Deckblatt generiert
- `iswipadsbib.sty` und `ipa_authoryear.{bbx,cbx}` ... Styling für die Bibliographie und Zitieren
- `iswipadsgloss.sty` ... Styling für Glossar und Abkürzungsverzeichnis mit dem Paket `glossaries` (falls benötigt)
- `diss_beispiel.tex` ... Beispielgerüst für die Diss. Eine Ordnerhierarchie nach oben kopieren

### Spätere Ordnersturkur des Diss-Ordners

```sh
Diss/
    Diss_Name.tex # Zu Beginn kopiert aus diss_beispiel.tex
    iswipads/ # Git submodule
        iswipads.cls
        iswipadsbib.sty
        ipa_authoryear.bbx
        ipa_authoryear.cbx
        iswipadsgloss.sty
    
    # optional für aufgeräumte Struktur
    settings/ # Einstell-Files
    kapitel/ # Hier der eigentliche Inhalt
    img/ # Fotos
    figures/ # Grafiken
    bibliography/ # bib-Datei (git submodule)
```


## FAQ

### Wie melde ich einen Fehler?

- Als [Issue aus Gitlab]()
- Noch besser: direkt auf einem Branch beheben und ein [Merge request]() stellen
- Größere Änderungen am besten vorher besprechen
