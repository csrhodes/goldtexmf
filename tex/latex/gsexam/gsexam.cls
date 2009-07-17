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
\input{size10.clo}
\pagenumbering{arabic}

\RequirePackage{substr}

\newif\if@checked
\@checkedtrue

\DeclareOption{unchecked}{\@checkedfalse}

\IfSubStringInString{\detokenize{answers}}{\jobname}{\PassOptionsToPackage{answers}{gsexam}}{}

\newif\if@practical

\DeclareOption{practical}{\@practicaltrue}

\newif\if@twoside
\@twosidetrue

\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}

\DeclareOption{answers}{\PassOptionsToPackage{answers}{gsexam}}
\DeclareOption{noanswers}{\PassOptionsToPackage{noanswers}{gsexam}}

\ProcessOptions

\RequirePackage{lastpage}
\RequirePackage[lmargin=1.25in,rmargin=1.25in]{geometry}
\RequirePackage{gsexam}

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

\newcounter{qmarks}[question]
\newcommand{\qmarks}[1]{\unskip\nobreak\hfill\rlap{\phantom{00000}\llap{[#1]}}\addtocounter{qmarks}{#1}}

\newenvironment{question}[2][]{
% Within a |question| environment, we ensure that labels and references 
% to |enumerate| |\item|s are appropriate: the labels are of the form 
% ``(a)'' and ``ii.'', while references generated with |\ref| are ``(a)''
% and a.(ii) repectively for first- and second-level |\item|s.
  \def\theenumi{(\alph{enumi})}
  \def\labelenumi{\theenumi}
  \def\theenumii{\alph{enumi}.(\roman{enumii})}
  \def\labelenumii{\roman{enumii}.}
  \def\qm@rks{#2}
  \stepcounter{question}
  \begin{trivlist}
    \item[\bfseries Question \arabic{question}] {\qquad#1}
      \begin{enumerate}
% Within this and child |enumerate| environments, we request a separation 
% of the text from the label by 0.5em.  Without this, the label and text 
% abut directly on each other.
        \setlength{\labelsep}{.5em}
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
