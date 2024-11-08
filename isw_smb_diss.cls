% basiert auf den Vorlagen von O. Gerlach (2015) und Philipp Tempel (2018) erweitert von C. Hinze (2020-2024)
% Richtlinien zur Formatierung der Dissertation: http://dx.doi.org/10.18419/opus-10327
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{isw_smb_diss}[2024/11/08 v. 1.9 Stuttgarter-Maschinenbau-Reihe für Dissertationen: https://github.com/iswunistuttgart/isw_smb_diss]
\typeout{}
\typeout{Stuttgarter Maschinenbau Dissertation LaTeX template class v1.9}
\typeout{}
\typeout{Institute for Control Engineering of Machine Tools and Manufacturing}
\typeout{Units, ISW, Seidenstrasse 36, D-70174 Stuttgart, Germany.}
\typeout{}

\ProcessOptions\relax
\newcommand{\documentfontsize}{14pt}
\newcommand{\titlewidth}{1.0}
\newcommand{\paperformatScr}{a4}
\newcommand{\paperformatGeom}{a4paper}
\newcommand{\introstart}{Der Fakultät}
\newcommand{\introstatus}{vorgelegte}
\newcommand{\documentsourceintro}{von}
\newcommand{\oralexamination}{Tag der mündlichen Prüfung: \>\\}
\newcommand{\linkcolor}{uniSblue}

\DeclareOption{smallfont}{
	\renewcommand{\documentfontsize}{12pt}
}

\DeclareOption{accepted}{
	\renewcommand{\introstart}{Von der Fakultät}
	\renewcommand{\introstatus}{genehmigte}
	\renewcommand{\documentsourceintro}{Vorgelegt von}
	\renewcommand{\oralexamination}{Tag der mündlichen Prüfung: \> \@dateoforalexamination \\}
	\renewcommand{\documentfontsize}{10pt}
	\renewcommand{\paperformatScr}{a5}
	\renewcommand{\paperformatGeom}{a5paper}
	\renewcommand{\linkcolor}{black}
	
	\DeclareOption{smallfont}{
		\renewcommand{\documentfontsize}{8pt}% 8.5 would be closer, but is not supported. Scale a little smaller to avoid overflowing floating environments.
	}
	
	% This avoids page breaks within bibliography entries
	\AtBeginDocument{%
	\patchcmd{\bibsetup}{\interlinepenalty=5000}{\interlinepenalty=10000}{}{}%
	}%
	}

\DeclareOption{print}{
	\renewcommand{\linkcolor}{black}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
\PassOptionsToPackage{paper=\paperformatScr,%
				  	}{typearea} % set papersize
\LoadClass[%
	fontsize=\documentfontsize,
	headings=normal,
	headsepline, % head has a separating line
	listof=totoc,% add a entry in table of contents for lists like LOF and LOT
	toc=chapterentrywithdots, % dots in table of contents also for chapter entries
	numbers=noenddot, % remove dot at end of caption and heading numbers
]{scrbook} % KOMA-Script scrreprt, DIN A5, 10pt with bibliography in TOC

% if/else (used within the class)
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}

\RequirePackage{babel} % hyphenation

\ifthenelse{\boolean{xetex}\OR\boolean{luatex}}{
	\relax
}{% pdflatex needs to know the ecoding
	\PassOptionsToPackage{T1}{fontenc} % T2A for cyrillics
	\RequirePackage{fontenc}  

	\PassOptionsToPackage{utf8}{inputenc} % directly support utf8 characters, as ä,ö,ü,Ü,ß
	\RequirePackage{inputenc}  	 
}

% load fonts: this is handled differently for lualatex/xetex and pdflatex
\ifthenelse{\boolean{xetex}\OR\boolean{luatex}}
   { % use fontspec and OpenType fonts with utf8 engines
	\RequirePackage{fontspec}%
	\defaultfontfeatures{Ligatures=TeX}%
	\setsansfont{texgyreheros}[
	%Scale=MatchLowercase,% or MatchUppercase
	Extension=.otf,
	UprightFont=*-regular,
	ItalicFont=*-italic,
	BoldFont=*-bold,
	BoldItalicFont=*-bolditalic,
	]
	
	\setmainfont{texgyrepagella}[
	%Scale=MatchLowercase,% or MatchUppercase
	Extension=.otf,
	UprightFont=*-regular,
	ItalicFont=*-italic,
	BoldFont=*-bold,
	BoldItalicFont=*-bolditalic,
	%Numbers={Proportional,OldStyle}
	]
	
	\linespread{1.05} % for pagella
	%\RequirePackage{unicode-math}
	%\setmathfont{TeX Gyre Pagella Math}%
	%\setmainfont[SmallCapsFeatures={LetterSpace=6}, Numbers={Proportional,OldStyle}]{Minion Pro}
	%\setsansfont[LetterSpace=3, Numbers={Proportional,OldStyle}]{Myriad Pro}
	\setmonofont[Scale=0.85]{DejaVu Sans Mono} 
   }
   { % use Type 1 fonts with pdflatex
	\PassOptionsToPackage{osf,sc}{mathpazo}%
	\RequirePackage{mathpazo} % Palatino with real small caps and old style figures
	\usepackage{tgheros}
	\linespread{1.05} % a bit more for Palatino
	\PassOptionsToPackage{scaled=0.85}{DejaVuSansMono}%
	\RequirePackage{DejaVuSansMono}%
	\RequirePackage{tgpagella}% main font
	\RequirePackage{textcomp}% declare missing symbols

	\PassOptionsToPackage{activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10}{microtype}
   }

% some font fine tuning
\RequirePackage{microtype}

\RequirePackage[onehalfspacing]{setspace} 
\RequirePackage[automark,% 
headsepline=0.20pt,% set header line
draft=false,]{scrlayer-scrpage}	 % header & footer layout
\automark[chapter]{chapter} % show chapters on both sides, if no section is defined
\automark*[section]{}% only show section in running header, if one is defined, otherwise use chapter title.
\pagestyle{scrheadings}

% make marks (e.g. page numbering) appearing on outer page (right) for onsesided print
\if@twoside\else
\ihead*[]{}
\chead*[]{}
\ohead*[]{\headmark}
\ifoot*[]{}
\cfoot*[]{}
\ofoot*[\pagemark]{\pagemark}
\fi

% same indentation for all sublevel headings, e.g. 
% 1. 	Chapter
% 1.1   Section
% 1.1.1 Subsection
% source: https://tex.stackexchange.com/a/382969
% This is desired by the publisher (but generates unneeded whitespace)
\newdimen\sectionnumberwdmax
\setlength\sectionnumberwdmax{3em}%
\renewcommand*{\chapterformat}{%
  \IfUsePrefixLine{\chapapp\nobreakspace\thechapter\autodot}{%
    \makebox[\sectionnumberwdmax][l]{\thechapter\autodot\hfil}%
  }%
}
\renewcommand*{\sectionformat}{\makebox[\sectionnumberwdmax][l]{\thesection\autodot\hfil}}
\renewcommand*{\subsectionformat}{\makebox[\sectionnumberwdmax][l]{\thesubsection\autodot\hfil}}
\renewcommand*{\subsubsectionformat}{\makebox[\sectionnumberwdmax][l]{\thesubsubsection\autodot\hfil}}
\renewcommand*{\paragraphformat}{\makebox[\sectionnumberwdmax][l]{\theparagraph\autodot\hfil}}
\renewcommand*{\subparagraphformat}{\makebox[\sectionnumberwdmax][l]{\thesubparagraph\autodot\hfil}}
% end same indentation for all sublevel headings

\RequirePackage[pdfusetitle]{hyperref}

% Colors (for links, ...)
\RequirePackage[dvipsnames]{xcolor}
\definecolor{uniSblue}{RGB}{0,65,145}
\definecolor{uniSlightblue}{RGB}{0,190,255}
\definecolor{uniSgrey}{RGB}{62, 68, 76}
\definecolor{uniSyellow}{RGB}{255, 213, 0}
\definecolor{uniSred}{RGB}{230, 0, 50}
\definecolor{uniSgreen}{RGB}{0, 200, 50} 

% to include images
\RequirePackage{graphicx}

\RequirePackage{titletoc}
\contentsmargin{2.5em}


% Place Floats on top of extra float page (i.e. \begin{figure}[p])
\setlength{\@fptop}{0pt}% default is 0\p@ \@plus 1fil
\setlength{\@fpsep}{\floatsep}% default is 8\p@ \@plus 2fil
\setlength{\@fpbot}{0pt plus 1fil}% default is 0\p@ \@plus 1fil

 
% Title commands: (hint: \author, \title already defined)
\newcommand*{\@birthplace}{\ClassError{isw_smb_diss}{\string\birthplace\space missing}%
	{You have to use \string\birthplace\space to set up the place of the author's birth.}}
\newcommand*\birthplace[1]{\renewcommand\@birthplace{#1}}

\newcommand*{\@examiner}{\ClassError{isw_smb_diss}{\string\examiner\space missing}%
	{You have to use \string\examiner\space to set up the your examiner,\MessageBreak e.g. `\string\examiner{Name of examiner}'.}}
\newcommand*\examiner[1]{\renewcommand\@examiner{#1}}

\newcommand*{\@coexaminer}{\ClassError{isw_smb_diss}{\string\coexaminer\space missing}%
	{You have to use \string\coexaminer\space to set up the your co-examiner,\MessageBreak e.g. `\string\coexaminer{Name of co-examiner}'.}}
\newcommand*\coexaminer[1]{\renewcommand\@coexaminer{#1}}

\newcommand*{\@faculty}{\ClassError{isw_smb_diss}{\string\institute\space missing}%
	{You have to use \string\faculty\space to set up the your Institute,\MessageBreak e.g. `\string\faculty{Konstruktions-, Produktions- und Fahrzeugtechnik}'.}}
\newcommand*\faculty[1]{\renewcommand\@faculty{#1}}

\newcommand*{\@institute}{\ClassError{isw_smb_diss}{\string\institute\space missing}%
	{You have to use \string\institute\space to set up the your Institute,\MessageBreak e.g. `\string\institute{Institut für Steuerungstechnik der Werkzeugmaschinen und Fertigungseinrichtungen}'.}}
\newcommand*\institute[1]{\renewcommand\@institute{#1}}

\newcommand*{\@dateoforalexamination}{\ClassError{isw_smb_diss}{\string\dateoforalexamination\space missing}%
	{You have to use \string\dateoforalexamination\space to set up the date of oral examination,\MessageBreak e.g. `\string\dateoforalexamination{TT.MM.YYYY}'.}}
\newcommand*\dateoforalexamination[1]{\renewcommand\@dateoforalexamination{#1}}

\newcommand*{\@yearofpublication}{\ClassError{isw_smb_diss}{\string\yearofpublication\space missing}%
	{You have to use \string\yearofpublication\space to set up the publication year of your thesis,\MessageBreak e.g. `\string\yearofpublication{YYYY}'.}}
\newcommand*\yearofpublication[1]{\renewcommand\@yearofpublication{#1}}

\renewcommand*{\maketitle}{%
  \begin{titlepage}
	{
    \centering
		\begin{minipage}{\titlewidth\textwidth}
			\centering
			{\LARGE\bfseries\sffamily\strut\ignorespaces\@title\par}
			\vspace*{1ex}
			{\large\sffamily\strut\ignorespaces\@subtitle\par}
		\end{minipage}
		\vfill
		\begin{minipage}{\titlewidth\textwidth}
			\centering
			\introstart\ \@faculty\\
			der  Universität Stuttgart\\ 
			zur Erlangung der Würde eines Doktor-Ingenieurs (Dr.-Ing.) 
			\introstatus\ Abhandlung\par%
		\end{minipage}
		\vfill
		\begin{minipage}{0.8\textwidth}
			\centering
		\documentsourceintro\\
    {\bfseries\strut\ignorespaces\@author\\}
    aus \@birthplace\par%
		\end{minipage}
    \vfill
		\begin{minipage}{0.8\textwidth}
			\begin{tabbing}
				Hauptberichter:\qquad\quad\qquad\qquad \=\@examiner \\
				Mitberichter:\> \@coexaminer \\[\baselineskip]
				\oralexamination
			\end{tabbing}
		\end{minipage}
		\vskip 2\baselineskip
		\begin{minipage}{0.8\textwidth}
			\centering
			\@institute\space der Universität Stuttgart\\
			\vskip \baselineskip
			\@yearofpublication
		\end{minipage}
    \clearpage
	}
  \end{titlepage}
}

% definitions for appendix sections
\newcommand\startSMBAppendix{
\cleardoublepage
\appendix
\renewcommand{\thesection}{\Alph{section}} % Appendix uses letters instead of numbers
\counterwithin{figure}{section} % Rename counters to start with appendix letter for easier recognition (when referencing)
\counterwithin{table}{section}
\renewcommand\thefigure{\thesection\arabic{figure}}
\renewcommand\thetable{\thesection\arabic{table}}

\automark[section]{section} %Fix the headline: chapter -> section, section -> subsection
\automark*[subsection]{}

\makeatletter
\renewcommand{\@seccntformat}[1]{Anhang \csname the##1\endcsname\quad} % Sections start with "Anhang", e.g. "Anhang A.1" (but not in table of contents)
\makeatother
}

%\ifpdf
%\fi

% style fixes for the publisher (Fraunhofer Verlag)
% get footnotes right
\deffootnote{1em}{1em}{\makebox[1em][l]{\textsuperscript{\thefootnotemark}}}

% remove listof.... indetation 
\setuptoc{lof}{noindent} % remove indentation from figures in lof
\setuptoc{lot}{noindent} % remove indentation from tables in lot

% Initialize hyperref
\hypersetup{%
	%hidelinks, % hides linkcolor -> all links become black
	linktocpage=true,
	colorlinks=true, linktocpage=true, pdfstartpage=3,% pdfstartview=FitV,%
	% uncomment the following line if you want to have black links (e.g., for printing)
	%colorlinks=false, linktocpage=false, pdfstartpage=3, pdfstartview=FitV, pdfborder={0 0 0},%
	breaklinks=true, pageanchor=true,%
	pdfpagemode=UseNone,%
	plainpages=false, bookmarksnumbered, bookmarksopen=true,% bookmarksopenlevel=1,%
	hypertexnames=true, pdfhighlight=/O,%
	urlcolor=\linkcolor, linkcolor=\linkcolor, citecolor=\linkcolor,%pagecolor=\linkcolor,%
}
