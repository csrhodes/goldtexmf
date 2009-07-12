\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gsmemo}
              [2009/06/07 v0.1
 Department of Computing, Goldsmiths class]

\ifx\XeTeXversion\@undefined
  \ClassError{gsmemo}
  {This class requires XeTeX}
  \expandafter\@@end
\fi

\setlength\paperheight{297mm}
\setlength\paperwidth{210mm}

\pagenumbering{arabic}

\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{afterpage}
\RequirePackage{lastpage}

% not really supported in XeTeX...
\RequirePackage[british]{babel}

\newif\if@sans
\DeclareOption{sans}{\@sanstrue}

\input{size11.clo}

\setromanfont[Mapping=tex-text]{Georgia}
\setsansfont[Mapping=tex-text]{Arial}

\newcommand{\from}[1]{%
  \ifdefined\@from%
    \edef\@from{\@from\par{#1}}%
  \else%
    \edef\@from{#1}%
  \fi}
% FIXME: OAOTM
\renewcommand{\to}[1]{%
  \ifdefined\@to%
    \edef\@to{\@to\par{#1}}%
  \else%
    \edef\@to{#1}%
  \fi}
\newcommand{\attach}[1]{%
  \ifdefined\@attach%
    \edef\@attach{\@attach\par{#1}}%
    \edef\@attachname{Attachments}%
  \else%
    \edef\@attach{#1}%
    \edef\@attachname{Attachment}%
  \fi}
\newcommand{\cc}[1]{%
  \ifdefined\@cc%
    \edef\@cc{\@cc\par{#1}}%
  \else%
    \edef\@cc{#1}%
  \fi}
\newcommand{\subject}[1]{%
  \edef\@subject{#1}}

\newcommand{\maketitle}{
  \thispagestyle{fancy}
  \if@sans
    \sffamily
  \fi
%  \begin{flushleft}
%    {\Large Memorandum}
%  \end{flushleft}
%  \vspace{2ex}
  \newsavebox{\@field}
  \begin{list}{\usebox{\@field}}{
      \setlength{\itemindent}{-0.5cm}
      \setlength{\labelwidth}{2.5cm}
      \setlength{\labelsep}{0.5cm}
      \setlength{\listparindent}{0cm}
      \setlength{\itemsep}{1ex}
      \setlength{\parsep}{0.2ex}
      \setlength{\topsep}{0ex}
    }
    \savebox{\@field}[3cm][r]{\textbf{Date}:}
  \item \today
    \savebox{\@field}[3cm][r]{\textbf{From}:}
  \item \@from
    \savebox{\@field}[3cm][r]{\textbf{To}:}
  \item \@to
    \ifdefined\@cc
      \savebox{\@field}[3cm][r]{\textbf{Cc}:}
      \item \@cc
    \fi
    \ifdefined\@attach
      \savebox{\@field}[3cm][r]{\textbf{\@attachname}:}
      \item \@attach
    \fi
    \savebox{\@field}[3cm][r]{\textbf{Subject}:}
  \item \@subject
  \end{list}
  \vspace{2ex}
  \setlength{\parindent}{0cm}
  \setlength{\parskip}{1.5ex}
  \afterpage{
    \lhead{\footnotesize \@subject}
    \chead{\footnotesize \today}
    \rhead{\footnotesize p.~\thepage\ of \pageref{LastPage}}
  }
}

\ProcessOptions

\setlength{\headheight}{29.5pt}
% FIXME: this if suggests that my fonts aren't set up right.  \textit
% seems to work OK in the main document, though.
\if@sans
  \lhead{\Large \textit{\textsf{Memorandum}}}
\else
  \lhead{\Large \textit{Memorandum}}
\fi
\lfoot{}
\chead{}
\cfoot{}
\rhead{\includegraphics{Goldsmiths_Black}}
\rfoot{}
\pagestyle{fancy}
