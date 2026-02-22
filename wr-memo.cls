\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wr-memo}[2025-09-09 My memo]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[text]{wrp}

%% Formatting -----------------------------------------------
%%% Margins ---
\RequirePackage[margin=1in,footskip=30pt,headsep=15pt,headheight=15pt]{geometry}

%%% Title custom ---
% Requires the titling package for \droptitle and hooks
% \usepackage{titling}

% --- \project command (optional; when set, header shows project, big title shows \title)
\let\@project\empty
\newcommand{\project}[1]{\def\@project{#1}}

% --- spacing "dials"
\newlength\TitleSep
\newlength\AuthorSep
\newlength\BlockBelow

% Tune dials
\setlength{\droptitle}{0pt}
\setlength{\TitleSep}{1\baselineskip}        % title ↔ author
\setlength{\AuthorSep}{0.5\baselineskip}        % author ↔ date
\setlength{\BlockBelow}{1.5\baselineskip}        % space after the block


\renewcommand{\maketitle}{%
  \newpage
  \ifdim\droptitle=0pt\else\vspace*{\droptitle}\fi% % stupid way to remove extra vspace above
  \begingroup
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}% symbols for \thanks
  \parindent=0pt \parskip=0pt \singlespacing
  \centering
  % --- header bar: show \project if set, otherwise \title
  \begin{minipage}[t]{0.6\textwidth}  % left block
    \raggedright
    \ifx\@project\empty
      \@title
    \else
      \@project
    \fi
    \par
    \begin{filename}\ttfamily\currfilename\end{filename}
  \end{minipage}%
  \begin{minipage}[t]{0.4\textwidth}  % right block
    \raggedleft
    \begingroup
      \def\and{,\space}%
      \@author
    \endgroup
    \par
    \@date
  \end{minipage}
  \vspace{\BlockBelow} % space before main text starts
  % --- big title: only when \project is set
  \ifx\@project\empty\else
    \par
    {\Large \@title\par}
    \vspace{\BlockBelow}
  \fi
  \endgroup
  \@thanks                      % render \thanks footnotes
  \global\let\@thanks\@empty    % clear so they don't repeat
  \setcounter{footnote}{0}%     % reset so body footnotes start from 1
  \suppressfloats[t] % keep floats below the title block on page 1
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

