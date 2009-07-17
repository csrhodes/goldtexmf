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

\IfSubStringInString{\detokenize{answers}}{\jobname}{\PassOptionsToPackage{answers}{gsexam}}{}

\newif\if@twoside
\@twosidetrue

\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}

\DeclareOption{answers}{\PassOptionsToPackage{answers}{gsexam}}
\DeclareOption{noanswers}{\PassOptionsToPackage{noanswers}{gsexam}}
\DeclareOption{unchecked}{\PassOptionsToPackage{unchecked}{gsexam}}

\ProcessOptions

\RequirePackage{lastpage}
\RequirePackage[lmargin=1.25in,rmargin=1.25in]{geometry}
\RequirePackage{gsexam}

% The implementation of the default header and footer layout for
% exams.  By default, there's nothin gin the headers.
\def\@evenhead{}
\def\@oddhead{}
% The footers contain examination information.  The left of the footer
% contains a reference to the course code and the year of the
% examination; the centre contains page numbering references (in the
% form "page m of n", in an attempt to make it very clear whether
% there are any pages missing); and the right contains END OF
% EXAMINATION at the end of an exam, and otherwise TURN OVER on all
% right-hand pages (which is \emph{all} pages if the |oneside| class
% option is provided).
\def\@leftmark{\makebox[0in][l]{\bfseries \@coursecode\quad\@examyear}}
\def\o@rightmark{\makebox[0in][r]{\bfseries \if@examend END OF EXAMINATION\else TURN OVER\fi}}
\if@twoside
  \def\e@rightmark{\makebox[0in][r]{\bfseries \if@examend END OF EXAMINATION\fi}}
\else
  \def\e@rightmark\o@rightmark
\fi
\def\@evenfoot{\@leftmark \hfil page \thepage\ of \pageref{LastPage} \hfil \e@rightmark}
\def\@oddfoot{\@leftmark \hfil page \thepage\ of \pageref{LastPage} \hfil \o@rightmark}

