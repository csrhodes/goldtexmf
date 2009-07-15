\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gsexam}
              [2009/03/27 v0.1
 Department of Computing, Goldsmiths class]

\ifx\eTeXversion\@undefined
  \ClassError{gsexam}
  {This class requires eTeX}
  \expandafter\@@end
\fi

\setlength\paperheight{297mm}
\setlength\paperwidth{210mm}

\RequirePackage{substr}
\RequirePackage{comment}

\newif\if@answers

\DeclareOption{answers}{\@answerstrue}
\DeclareOption{noanswers}{\@answersfalse}

\newif\if@checked
\@checkedtrue

\DeclareOption{unchecked}{\@checkedfalse}

\IfSubStringInString{\detokenize{answers}}{\jobname}{\@answerstrue}{\@answersfalse}

\newif\if@practical

\DeclareOption{practical}{\@practicaltrue}

\newif\if@twoside
\@twosidetrue

\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}

\ProcessOptions

% since comment is based on verbatim, this only works
% if \begin{answer} and \end{answer} are the first things on their
% respective lines
%
% the accompanying |gsexam.el| file is sufficient to inform AUC\-\TeX
% (the emacs mode for editing \LaTeX) about the need to indent
% |\begin{answer}| and |\end{answer}| specially.  It can be loaded
% directly, or will be dealt with automatically if installed in a
% directory mentioned in the emacs variable |TeX-style-path|.  (If
% editing a file from scratch, typing |C-c C-n| or selecting the
% |Reset Buffer| menu option from the |LaTeX| menu after the buffer
% contents contain the directive to load this class should be
% sufficient to load the relevant customizations).
\if@answers
  \specialcomment{answer}{\begingroup\itshape\par}{\endgroup}
\else
  \excludecomment{answer}
\fi

\input{size10.clo}

\RequirePackage{lastpage}
\RequirePackage[lmargin=1.25in,rmargin=1.25in]{geometry}

\newif\if@examend

\def\@evenhead{}
\def\@oddhead{}
\def\@leftmark{\makebox[0in][l]{\bfseries \@coursecode\quad\@examyear}}
\def\o@rightmark{\makebox[0in][r]{\bfseries \if@examend END OF EXAMINATION\else TURN OVER\fi}}
\if@twoside
  \def\e@rightmark{\makebox[0in][r]{\bfseries \if@examend END OF EXAMINATION\fi}}
\else
  \def\e@rightmark\o@rightmark
\fi
\def\@evenfoot{\@leftmark \hfil page \thepage\ of \pageref{LastPage} \hfil \e@rightmark}
\def\@oddfoot{\@leftmark \hfil page \thepage\ of \pageref{LastPage} \hfil \o@rightmark}

\newcommand{\coursecode}[1]{\def\@coursecode{#1}}
\newcommand{\examyear}[1]{\def\@examyear{#1}}
\newcommand{\subject}[1]{\def\@subject{#1}}
\newcommand{\coursetitle}[1]{\def\@coursetitle{#1}}
\newcommand{\examtime}[1]{\def\@examtime{#1}}
\newcommand{\coverpage}{\@coverhead}

\pagenumbering{arabic}

\newenvironment{bscexam}{
  \global\@examendfalse
  \setcounter{question}{0}
  \def\@coverhead{
    \begin{flushleft}
      \Large \bfseries UNIVERSITY OF LONDON\\ [14pt]
      GOLDSMITHS COLLEGE\\ [14pt]
      B.~Sc.~Examination \@examyear\\ [28pt]
      \@subject\\ [14pt]
      \@coursecode \quad \@coursetitle\\ [14pt]
      \large \bfseries Duration: \@examtime\\ [14pt]
      Date and time: \\ [14pt]
    \end{flushleft}
    \hrule\par\vskip12pt\relax}}
  {\global\@examendtrue}

% Bug: these definitions have global scope.  It would be much nicer
% to have them only be like this within \begin{bscexam}
%   .. \end{bscexam} so that inclusion of an exam paper in another
% document doesn't make all the numbering screwy.  Since this is a
% class not a style, that doesn't matter so much, but it will matter
% once the style based on this class is implemented.
%
% FIXME: find out how to make these have local scope.  One way is of
% course to take the current definitions (if applicable), save them
% away at \begin{question}, and restore them at \end{question}.  It
% might be possible to do better...
\renewcommand{\theenumi}{(\alph{enumi})}
\newcommand{\labelenumi}{\theenumi}
\renewcommand{\theenumii}{\alph{enumi}.(\roman{enumii})}
\newcommand{\labelenumii}{\roman{enumii}.}

\newcounter{question}
\newcounter{qmarks}[question]
\newcommand{\qmarks}[1]{\unskip\nobreak\hfill\rlap{\phantom{00000}\llap{[#1]}}\addtocounter{qmarks}{#1}}

\newenvironment{question}[2][]{
  \clearpage
  \def\qm@rks{#2}
  \stepcounter{question}
  \begin{trivlist}
    \item[\bfseries Question \arabic{question}] {~#1}
      \begin{enumerate}
  }
  {\end{enumerate}\end{trivlist}%
\ifnum\qm@rks=\value{qmarks}
\else
  \if@checked
  \typeout{Mark mismatch in question \arabic{question}: expected \qm@rks, got \arabic{qmarks}}
  \centering 
  This question has a mark count mismatch: expected \textbf{\qm@rks},
  got \textbf{\arabic{qmarks}}.
  \fi

\fi}

\setlength{\leftmargini}{2.5em}
\setlength{\leftmarginii}{1.4em}
\setlength{\labelsep}{.5em}
\setlength{\labelwidth}{\leftmargini}
\addtolength{\labelwidth}{-\labelsep}
