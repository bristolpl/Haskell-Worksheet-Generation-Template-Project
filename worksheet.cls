\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{worksheet}[2018/10/07 Worksheets]

\DeclareOption{answers}{
  \PassOptionsToClass{\CurrentOption}{exam}
}
\ProcessOptions\relax

\LoadClass[a4paper,10pt,addpoints]{exam}

\pagestyle{foot}
\footer{}{\thepage}{}

\usepackage{enumerate}
\usepackage[margin=2cm]{geometry}
\newcommand{\starred}{%
  \leavevmode\makebox[0pt][r]{\large$\star\,$\hspace{1.5em}}}
\newcommand{\medium}{%
  \leavevmode\makebox[0pt][r]{\large$\dagger\,$\hspace{1.5em}}}
\newcommand{\difficult}{%
  \leavevmode\makebox[0pt][r]{\large$\dagger\dagger\,$\hspace{1.5em}}}
\newcommand{\death}{%
  \leavevmode\makebox[0pt][r]{\large$\dagger\!\!\dagger\!\!\dagger\,$\hspace{1.5em}}}

\usepackage{graphicx}
\usepackage{xcolor}
\newcommand{\hint}[1]{\newline {\small Hint:}\raisebox{\depth}{\rotatebox{180}{\small #1}}}

\usepackage{etoolbox}
\renewcommand{\thequestion}{\thesection.\arabic{question}}
\patchcmd{\questions}{10.}{\thequestion.}{}{}% fix left margin

\renewcommand\maketitle{
  \begin{center}
  {\LARGE\bfseries \@title \par}
    \vspace{0.5cm}
    {\Large \@author}
  \end{center}
}
