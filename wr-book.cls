\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wr-book}[2025-11-03 My book]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass{memoir}

\RequirePackage[text]{wrp}
%
%% Formatting -----------------------------------------------
%%% Margins ---
\RequirePackage[margin=1in,footskip=30pt,headsep=15pt,headheight=15pt]{geometry}

%%% Title custom ---
% Requires the titling package for \droptitle and hooks
% \usepackage{titling}

% --- spacing "dials"
\newlength\TitleSep     
\newlength\AuthorSep     
\newlength\BlockBelow   

% Tune dials
\setlength{\droptitle}{0pt}
\setlength{\TitleSep}{1\baselineskip}        % title ↔ author
\setlength{\AuthorSep}{0.5\baselineskip}        % author ↔ date
\setlength{\BlockBelow}{1.5\baselineskip}        % space after the block


% footnote spacing between number and text
\renewcommand{\@makefntext}[1]{\textsuperscript{\@thefnmark}\hspace{0.5em}#1}

%%% Section custom ---
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{5} % paragraphs / subparagraphs in TOC
\titleformat{\part}
    {\Large\bfseries}{\thepart}{1em}{}
\titleformat{\paragraph}[hang]{\bfseries}{\theparagraph}{1em}{}
\titlespacing{\part}{0pt}{*2}{*2}
\titlespacing{\section}{0pt}{*1.5}{*1.5}
\titlespacing{\subsection}{0pt}{*1}{*1}
\titlespacing{\subsubsection}{0pt}{*1}{*1}
\titlespacing{\paragraph}{0pt}{*1}{*1}

%%% Itemize custom ---
\setlist{topsep=0.2em, itemsep=0.2em} 

%%%% Spacing --- 
%\setstretch{1.1} % line spacing
%\setlength{\parskip}{0.4em} % paragraph skip spacing
%\setlength{\parindent}{0pt} % no indent

% — Page geometry: narrow measure + big outer margin
% 1) Set the text block size…
\settypeblocksize{*}{24em}{*} % ~66 CPL, adjust to taste
% 2) Make outer margin ≈ 2.5× inner (Tufte-esque spread)
\setlrmargins{*}{*}{2.5}      % E = 2.5 * S; both solved from page & block
% 3) Top/bottom margins (keep bottom heavier)
\setulmargins{*}{*}{1.2}      % tweak as you like

% — Space reserved for margin notes
\setmarginnotes{7pt}{2in}{\onelineskip} % sep, width, vertical push

\checkandfixthelayout % always after the set* layout calls

% — Sidenotes (non-floating) that stick to the outer margin
\sideparmargin{outer}
\newcommand{\sidenote}[1]{\sidepar{\footnotesize #1}}

% — Margin footnotes, if you want Tufte-like footnotes in the margin
% (either use true side footnotes…)
%\sidefootmargin{outer}
%\letcountercounter{sidefootnote}{footnote} % share counter with footnotes
%\newcommand{\marginfoot}[1]{\sidefootnote{#1}}
% …or just route regular footnotes into the margin:
\footnotesinmargin

% — Side captions for figures/tables
\sidecapmargin{outer}
\setsidecaps{\marginparsep}{\marginparwidth} % keep caption box = margin width

% — Chapter/section look: pick a light chapterstyle; keep sections quiet
\chapterstyle{bringhurst} % or 'article' / 'dash' etc.
\setsecheadstyle{\scshape\large}  % small caps, unobtrusive
\setsubsecheadstyle{\scshape\normalsize}

% Optional: Tufte-like body feel
\setlength{\parindent}{1em}
\setlength{\parskip}{0pt}
%\raggedright % uncomment if you prefer ragged-right body text




