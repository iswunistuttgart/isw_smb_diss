# 1.7 -- 2023-10-10

Feedback from pubishing of colleagues:

- [readme] Provide some help for publishing process in the [Readme's FAQ section](https://github.com/iswunistuttgart/isw_smb_diss/blob/master/README.md#faq)
- [class] Go back from manaual setting page geometry, use komascript's native one instead
- [example] Add option for ragged bottom
- [example] Add option to force avoid bibliography entry splitting on two pages

# 1.6.1 -- 2023-07-28

Further feedback from publisher:

- [class] Fix indentation for `listoffigures` and `listoftables` to align with textarea

# 1.6 -- 2023-07-21

Feedback from publishing my dissertation:

- [class] Fix footnotes appearing outside of type area
- [class] English title is added on title page  as required by faculty now (https://www.f07.uni-stuttgart.de/forschung/promotion-und-habilitation/promotion/dokumente/Titelblatt-Dissertation-1Einreichung_2Drucklegung.pdf)
- [example] Work on apppendix format
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