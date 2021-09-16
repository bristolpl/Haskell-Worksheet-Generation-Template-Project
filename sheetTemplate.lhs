%if false

> module SheetTemplate where

%endif

%if dyslexic
%if answers
\documentclass[answers, dyslexic]{worksheet}
%else
\documentclass[dyslexic]{worksheet}
%endif
%else
%if answers
\documentclass[answers]{worksheet}
%else
\documentclass{worksheet}
%endif
%endif

\usepackage{multicol}
%include polycode.fmt
%include format.fmt
% Import worksheet.sty with our styling and macros
\usepackage{worksheet}

\title{Advanced Topics in Programming Languages}
\author{Worksheet 1 ::
%if answers
Answers
%else
Questions
%endif
}
\date{2020/2021}
\newcommand{\superfluous}[1]{\underline{\textcolor{gray}{\textbf{#1}}}}
\newcommand{\redundant}[1]{\underline{\textcolor{gray}{\textbf{#1}}}}
\begin{document}
\maketitle


\section{Section}

\begin{enumerate}

\item Question

> questionCode = undefined

\begin{solution}
Question solution
\end{solution}

\item Another question

\begin{solution}
Another solution
\end{solution}

\end{enumerate}

\end{document}
