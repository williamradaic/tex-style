\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wr-tufte-book}[2025-11-03 My tufte book]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass{memoir}

%\RequirePackage[margin=1in,footskip=30pt,headsep=15pt,headheight=15pt]{geometry}
\RequirePackage[text]{wrp}

%% --- Margin notes/sidenotes
%\setmarginnotes{7pt}{2in}{\onelineskip} % sep, width, vertical push
%\sideparmargin{outer}
%\newcommand{\sidenote}[1]{\sidepar{\footnotesize #1}}
%\setulmarginsandblock{2in}{2in}{*}
\setlrmargins{*}{*}{2}        % was 2.5; smaller outer vs inner
% layout for margin notes (memoir controls these):
\setmarginnotes{25pt}{3cm}{\onelineskip} % sep from text, note width, min sep between notes
\marginparmargin{outer}                  % put notes on the outer margin in twoside
\checkandfixthelayout

% non-floating margin notes:
\usepackage{marginnote}
% memoir exposes a hook for the margin note font:
\renewcommand*{\marginfont}{\footnotesize}
% --- Footnotes in the margin (Tufte vibe)
\footnotesinmargin

% --- Margin (side) captions for floats
\sidecapmargin{outer}
\setsidecaps{\marginparsep}{\marginparwidth}

% Always fix layout after the set* calls above
\checkandfixthelayout

% ===== Headings: Tufte-ish section & chapter styles =====
% Sections: italic, unnumbered, left-aligned, airy spacing
\setsecnumdepth{none}
\setsecheadstyle{\itshape\Large}
\setbeforesecskip{1.2\baselineskip}
\setaftersecskip{0.6\baselineskip}
\setsecindent{0pt}

% Subsections to match (smaller, still italic)
\setsubsecheadstyle{\itshape\large}
\setbeforesubsecskip{1.0\baselineskip}
\setaftersubsecskip{0.4\baselineskip}
\setsubsecindent{0pt}

% Chapter: italic, left-aligned, no "Chapter N", generous whitespace
\makechapterstyle{tufteish}{%
  \chapterstyle{default}%
  \renewcommand*{\printchaptername}{}%
  \renewcommand*{\chapternamenum}{}%
  \renewcommand*{\printchapternum}{}%
  \renewcommand*{\printchaptertitle}[1]{\raggedright\itshape\Huge ##1}%
  \setlength{\beforechapskip}{1\baselineskip}%
  \setlength{\midchapskip}{0pt}%
  \setlength{\afterchapskip}{2\baselineskip}%
}
\chapterstyle{tufteish}
\aliaspagestyle{chapter}{plain} % clean chapter opening page

% Optional: small-caps lead-in for first sentences ("new thought")
\newcommand{\newthought}[1]{\noindent{\scshape #1}\,}
	
% Body feel
\setlength{\parindent}{1em}
\setlength{\parskip}{0pt}
% \raggedright % uncomment if you prefer ragged-right text
