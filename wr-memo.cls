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
  \parindent=0pt \parskip=0pt \singlespacing
  \centering
  \begin{minipage}[t]{0.6\textwidth}  % left block
    \raggedright
    \@title \par
    \begin{filename}\ttfamily\currfilename\end{filename}
  \end{minipage}%
  \begin{minipage}[t]{0.4\textwidth}  % right block
    \raggedleft
    \@author \par
    \@date
  \end{minipage}
  \vspace{\BlockBelow} % space before main text starts
  \endgroup
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

