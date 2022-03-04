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
    - [Ich bekomme eine Warnung `You have requested document class 'isw_smb_diss/isw_smb_diss', but the document class provides 'isw_smb_diss'.`](#ich-bekomme-eine-warnung-you-have-requested-document-class-isw_smb_dissisw_smb_diss-but-the-document-class-provides-isw_smb_diss)

## Anleitung zum Aufsetzen meiner Dissertation 

| Methode                                                            | Vorteile                                                                                                                                          | Nachteile                                                                                                                                                                          |
| ------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Weg 1: Als Git submodule](#weg-1-als-git-submodule-ohne-overleaf) | - Modular eingebunden  <br /> -  Updates einfach über git                                                                                         | Geht nicht mit Ovelreaf (Unterstützt keine git submodules)                                                                                                                         |  |
| [Weg 2: Nur die Dateien verwenden](#weg-2-mit-overleaf))           | - Lässt sich in Overleaf nutzen <br />- Das Diss-Verzeichnis kann trotzdem in Git eingecheckt werden, nur die Verbindung zur Klasse geht verloren | Updates in der Klasse müssen von Hand heruntergeladen werden (oder über die [Github API mit curl](https://stackoverflow.com/questions/46060010/download-github-release-with-curl)) |


### Weg 1: Als git submodule (ohne Overleaf)

1. Anlegen eines Diss-Ordners als Git-Repository
2. Einbinden dieses Repositories als Git-Submodul

    ```sh
    # git Kommandozeile
    # über https (meistens einfacher)
    git submodule add https://github.com/iswunistuttgart/isw_smb_diss.git
    # oder über ssh (SSH-Key muss eingerichtet sein)
    git submodule add git@github.com:iswunistuttgart/isw_smb_diss.git
    ```

3. Als Gerüst zur Strukturierung der Diss kann `diss_beispiel.tex` aus dem Submodul/Unterordner `isw_smb_diss` in den eigenen Ordner kopiert werden.
4. Spätere Updates der Klasse über

    ```
    git submodule update --remote
    ```


### Weg 2: Mit Overleaf

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

- Als [Issue aus GitHub](https://github.com/iswunistuttgart/isw_smb_diss/issues/new)
- Noch besser: direkt auf einem Branch beheben und einen [pull request](https://github.com/iswunistuttgart/isw_smb_diss/compare) stellen
- Für Änderungen gibt es keine Merge-Garantie, daher am besten vorher besprechen

### Ich bekomme eine Warnung `You have requested document class 'isw_smb_diss/isw_smb_diss', but the document class provides 'isw_smb_diss'.`

Siehe auch [PR:  Fix wrong ProvidesClass entry #5](https://github.com/iswunistuttgart/isw_smb_diss/pull/5)

Entsteht, indem die Latex-Klasse aus einem Unterordner eingebunden wird (z.B. als [Git Submodule](#weg-1-als-git-submodule-ohne-overleaf)). Die Klasse sollte trotzdem funktionieren. Die Warnung kann behoben werden, indem dieses Repository [installiert wird](https://tex.stackexchange.com/questions/10498/installing-a-class), oder der Pfad der Klasse in die Umgebungsvariable [`TEXINPUTS`](https://tex.stackexchange.com/questions/153135/how-to-store-the-documents-style-file-in-a-subdirectory/153138#153138) aufgenommen wird. (Danach `\documentclass[...]]{isw_smb_diss/isw_smb_diss}` ändern zu `\documentclass[...]]{isw_smb_diss}`)