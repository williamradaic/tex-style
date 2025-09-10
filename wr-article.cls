\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wr-article}[2025-09-09 My article]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[text]{wrp}

%% Formatting -----------------------------------------------
%%% Margins ---
\RequirePackage[margin=1in,footskip=30pt,
headsep=15pt,headheight=15pt,showframe]{geometry}

%%% Title custom ---

% --- spacing "dials"
\newlength\TitleSep     
\newlength\AuthorSep     
\newlength\BlockBelow   

% Tune dials
\setlength{\droptitle}{0pt}
\setlength{\TitleSep}{1\baselineskip}        % title ↔ author
\setlength{\AuthorSep}{0.5\baselineskip}        % author ↔ date
\setlength{\BlockBelow}{1\baselineskip}        % space after the block

\renewcommand{\@maketitle}{%
\newpage
\ifdim\droptitle=0pt\else\vspace*{\droptitle}\fi% % stupid way to remove extra vspace above
  \maketitlehooka
  % ---- Title block (no list environments = no stray topsep)
    \begingroup
    \parindent=0pt \parskip=0pt \singlespacing
    \centering
    % filename line (drop the center environment; just \centering)
    {\begin{filename}\ttfamily\currfilename\par\end{filename}}
    % Title (only if provided)
    \ifx\@title\@empty\else
      {\LARGE \@title \par}%
    \fi
    \vspace{\TitleSep}%
    % Authors; keep \and working like article class does
    \begingroup
      \def\and{\end{tabular}\hspace{1.25em}\begin{tabular}[t]{@{}c@{}}}%
      \ifx\@author\@empty\else
        \begin{tabular}[t]{@{}c@{}}\large \@author\end{tabular}\par
      \fi
    \endgroup
    \vspace{\AuthorSep}%
    % Date (only if provided)
    \ifx\@date\@empty\else
      {\large \@date \par}%
    \fi
  \endgroup
  \maketitlehookb
  \vspace{\BlockBelow}%
  \maketitlehookc
  \par
  \maketitlehookd
}

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

%%% Spacing --- 
\setstretch{1.1} % line spacing
\setlength{\parskip}{0.4em} % paragraph skip spacing
\setlength{\parindent}{0pt} % no indent

