\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gsexam}
              [2009/03/27 v0.1
 Department of Computing, Goldsmiths class]

\ifx\eTeXversion\@undefined
  \ClassError{gsexam}
  {This class requires eTeX}
  \expandafter\@@end
\fi

\RequirePackage{substr}
\RequirePackage{comment}

\newif\if@answers

\DeclareOption{answers}{\@answerstrue}
\DeclareOption{noanswers}{\@answersfalse}

\IfSubStringInString{\detokenize{answers}}{\jobname}{\@answerstrue}{\@answersfalse}

\setlength\paperheight{297mm}
\setlength\paperwidth{210mm}

\ProcessOptions

\if@answers
  \includecomment{answer}
\else
  \excludecomment{answer}
\fi

\input{size10.clo}
