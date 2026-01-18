# 1.10 -- 2026-01-17

- [class] to minimize layout issues after adding the `accepted` class option, definition of `accepted` was changed to just change the title page. 
          To print all links in black use option `print` from now on. 
          Paper format will stay in A4 and the publisher should just scale the A4 pages to A5 paper for the final print of your dissertation.
          For true DIN-A5 format there is an additional class option `a5paper` now. Be warned that the change might lead to layout issues
- [glossaries] [MR #15](https://github.com/iswunistuttgart/isw_smb_diss/pull/15 ) by [@wolfmar](https://github.com/wolfmar) removes a temporary workaround for `automake`option of package `glossaries-extra`, which is not needed anymore as of latex versions 2025+ 
- [readme] adapted to changed class

# 1.9 -- 2024-11-08

- [class] add class option print (currently turns links black for printing first version)
- [class] As requested by the publisher, all section headings have the same indentation now
- [example] Use \raggebottom for pages to avoid future headache (publisher wants this explicitly)
- [class,example] Move appendix redefinitions to single command `\startSMBAppendix`, defined in cls file
- [class,example] Fix v1.8 behavior of headlines. Should be working properly now
- [class] Add some explaining comments, have all comments in English
- [example] Use English language for comments (preparations for internationalization)
- [cleanup] Deleted TexStudio Macros as too specific

# 1.8 -- 2024-10-09

Futher feedback from publishing:

- [class] Fix headline: Was empty on one side of the book when no section defined in chapter (default komascript style). Publisher requested to have chapter on both page headings then
- [class] Fix literature entries should not break between pages in final mode (with class option `accepted`)
- [example] Fix TexStudio magic comments to build automatically with biber 

# 1.7 -- 2023-10-10

Feedback from pubishing of colleagues:

- [readme] Provide some help for publishing process in the [Readme's FAQ section](https://github.com/iswunistuttgart/isw_smb_diss/blob/master/README.md#faq)
- [class] Go back from manual setting page geometry, use komascript's native one instead
- [example] Add option for ragged bottom
- [example] Add option to force avoid bibliography entry splitting on two pages

# 1.6.1 -- 2023-07-28

Further feedback from publisher:

- [class] Fix indentation for `listoffigures` and `listoftables` to align with textarea

# 1.6 -- 2023-07-21

Feedback from publishing my dissertation:

- [class] Fix footnotes appearing outside of type area
- [class] English title is added on title page  as required by faculty now (https://www.f07.uni-stuttgart.de/forschung/promotion-und-habilitation/promotion/dokumente/Titelblatt-Dissertation-1Einreichung_2Drucklegung.pdf)
- [example] Work on appendix format
- [example] Fix running head of bibliography only appearing on even pages (solution is to add the bibliography to toc with class option "toc=bib," and not to call "heading=bibintoc" in \printbibliography)
- [example] Some cleanup
- [example] Provide example for glossary settings


# 1.5.0 -- 2022-11-30

- Moved bibliography definition to `diss_beispiel.tex` ([Bugfix, if you started with v<1.5](https://github.com/iswunistuttgart/isw_smb_diss/blob/master/README.md#nach-update-auf-version-150-kompiliert-mein-dokument-nicht-mehr))
- Worked on title page (now has english title as required by faculty 7)
- class now has a `smallfont` option for more space (12 pt in A4/manuscript)
- class now has a `oneside` option for onesided print of the manuscript
- Fixed figure/table numbers in appendix
- Improved glossaries style to work with german hyphenation, better formatting
  

# 1.4.3 -- 2022-04-19

- Feedback from first published dissertation with this template:
  - improved glossaries style
  - set link color to black for print (with option `accepted`)
  - Fix headline appearing on first page of toc, lof, lot, ...
  - Syntax error in basehead fixed
- Fix undefined date of oral examination


# 1.4.2 -- 2022-03-04

- [Use proper document class name](https://github.com/iswunistuttgart/isw_smb_diss/pull/5) (Thanks [@philipptempel](https://github.com/philipptempel))

# 1.4.1 -- 2022-02-19

- Fix capitalization error on title page
- Add support for long words hyphenation

# 1.4.0 - 2021-12-01

- Initial release on GitHub