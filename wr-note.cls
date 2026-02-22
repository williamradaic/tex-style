\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wr-note}[2026-02-22 My note]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[text]{wrp}

%% Formatting -----------------------------------------------
%%% Margins ---
\RequirePackage[margin=1in,footskip=30pt,headsep=15pt,headheight=15pt]{geometry}

%%% Title custom ---

% --- \project command (optional; when set, appears above the title as a label)
\let\@project\empty
\newcommand{\project}[1]{\def\@project{#1}}

% --- spacing "dials"
\newlength\TitleSep
\newlength\AuthorSep
\newlength\BlockBelow
\newlength\ProjectSep

% Tune dials
\setlength{\droptitle}{0pt}
\setlength{\ProjectSep}{0.25\baselineskip} % project label ↔ title
\setlength{\TitleSep}{0.5\baselineskip}    % title ↔ author
\setlength{\AuthorSep}{0.25\baselineskip}  % author ↔ date line
\setlength{\BlockBelow}{1.5\baselineskip}  % space after the block

\renewcommand{\maketitle}{%
  \newpage
  \ifdim\droptitle=0pt\else\vspace*{\droptitle}\fi
  \begingroup
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}% symbols for \thanks
  \parindent=0pt \parskip=0pt \singlespacing
  % Project/filename line above title:
  %   - project set: "project | filename.tex" (filename conditional on toggle)
  %   - no project:  just "filename.tex" (conditional on toggle)
  \ifx\@project\empty
    \iftoggle{printFileName}{%
      {\small\ttfamily \currfilename \par}%
      \vspace{\ProjectSep}%
    }{}%
  \else
    {\small\itshape \@project
      \iftoggle{printFileName}{\enspace|\enspace{\upshape\ttfamily\currfilename}}{}%
    \par}%
    \vspace{\ProjectSep}%
  \fi
  % Title: \Large, not bold, flush left
  \ifx\@title\@empty\else
    {\Large \@title \par}%
  \fi
  \vspace{\TitleSep}%
  % Author(s) flush left; \and inserts a comma separator
  \ifx\@author\@empty\else
    \begingroup
      \def\and{,\space}%
      \@author \par%
    \endgroup
  \fi
  \vspace{\AuthorSep}%
  % Date
  \ifx\@date\@empty\else
    \@date \par
  \fi
  \endgroup
  \@thanks                      % render \thanks footnotes
  \global\let\@thanks\@empty    % clear so they don't repeat
  \setcounter{footnote}{0}%     % reset so body footnotes start from 1
  \vspace{\BlockBelow}%
  \suppressfloats[t]%
}

% footnote spacing between number and text
\renewcommand{\@makefntext}[1]{\textsuperscript{\@thefnmark}\hspace{0.5em}#1}

%%% Section custom ---
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{5}
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

%%% Spacing ---
\setstretch{1.1}
\setlength{\parskip}{0.4em}
\setlength{\parindent}{0pt}
