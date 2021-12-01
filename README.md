# isw_smb_diss

LaTeX Style für Dissertationen der Schriftenreihe Stuttgarter Maschinenbau (SMB).

- [isw_smb_diss](#isw_smb_diss)
  - [Anleitung zum Aufsetzen meiner Dissertation](#anleitung-zum-aufsetzen-meiner-dissertation)
    - [Weg 1: Als git submodule (ohne Overleaf)](#weg-1-als-git-submodule-ohne-overleaf)
    - [Weg 2: Mit Overleaf](#weg-2-mit-overleaf)
  - [Struktur](#struktur)
    - [Spätere Ordnersturkur des Diss-Ordners](#spätere-ordnersturkur-des-diss-ordners)
  - [FAQ](#faq)
    - [Wie melde ich einen Fehler?](#wie-melde-ich-einen-fehler)

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
    git submodule add https://git.isw.uni-stuttgart.de/projekte/eigenentwicklungen/templates/isw_smb_diss.git
    # oder über ssh (SSH-Key muss eingerichtet sein)
    git submodule add git@git.isw.uni-stuttgart.de:projekte/eigenentwicklungen/templates/isw_smb_diss.git
    ```

3. Als Gerüst zur Strukturierung der Diss kann `diss_beispiel.tex` aus dem Submodul/Unterordner `isw_smb_diss` in den eigenen Ordner kopiert werden.
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

1. Repository auschecken oder downloaden und folgende Dateien in den Ordner `isw_smb_diss/` im eigenen Dissertationsverzeichnis kopieren:

    ```
    isw_smb_diss.cls  isw_smb_gloss.sty
    ```
2. Als Gerüst zur Strukturierung der Diss kann `diss_beispiel.tex` in den eigenen Ordner kopiert werden.
3. Spätere Updates müssen wie in Schritt 1. erfolgen

## Struktur

- `isw_smb_diss.cls` ... Klasse, die das generelle Styling festlegt und das Deckblatt generiert
- `isw_smb_gloss.sty` ... Styling für Glossar und Abkürzungsverzeichnis mit dem Paket `glossaries` (falls benötigt)
- `diss_beispiel.tex` ... Beispielgerüst für die Diss. Eine Ordnerhierarchie nach oben kopieren
- `settings_example/*.tex` ... Beispiele von Settings-Dateien für Command definitions und TikZ-Code
- `.gitignore` ... Gitignore-Datei für LaTeX, kann gerne auch in den eigenen Diss-Ordner übernommen werden

### Spätere Ordnersturkur des Diss-Ordners

```sh
Diss/
    Diss_Name.tex # Zu Beginn kopiert aus diss_beispiel.tex
    isw_smb_diss/ # Git submodule
        isw_smb_diss.cls
        isw_smb_gloss.sty
    
    # optional für aufgeräumte Struktur
    settings/ # Einstell-Files
    kapitel/ # Hier der eigentliche Inhalt
    img/ # Fotos
    figures/ # Grafiken
    bibliography/ # bib-Datei (git submodule)
```


## FAQ

### Wie melde ich einen Fehler?

- Als [Issue aus Gitlab](https://git.isw.uni-stuttgart.de/projekte/eigenentwicklungen/templates/isw_smb_diss/-/issues/new)
- Noch besser: direkt auf einem Branch beheben und ein [Merge request](https://git.isw.uni-stuttgart.de/projekte/eigenentwicklungen/templates/isw_smb_diss/-/merge_requests/new) stellen
- Für Änderungen gibt es keine Merge-Garantie, daher am besten vorher besprechen
