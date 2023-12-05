%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX class for the Master Thesis Proposal
% at the Software Institute of USI
% 
% Contributors:
% Michele Lanza
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% IDENTIFICATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{si-msc-proposal}[Software Institute Master %
Thesis Proposal class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% REQUIRED PACKAGES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{textcomp}
\RequirePackage{url}
\RequirePackage{amsmath}
\RequirePackage{xifthen}
\RequirePackage{lipsum}

%%%
\DeclareOption*{% 
    \PassOptionsToClass{\CurrentOption}{document}%
}
%%% execution of options
\ProcessOptions \relax
\typeout{*** Please report bugs, comments, suggestions, and improvements to: }
\typeout{*** Software Institute <si@usi.ch>}

%%% package loading
\LoadClass[a4paper,11pt]{article}
%%% main code

%font settings
\RequirePackage[T1]{fontenc}
\RequirePackage[charter]{mathdesign}
\RequirePackage[scaled]{beramono}

\renewcommand{\sfdefault}{uop}
\renewcommand{\scshape}{%
    \not@math@alphabet\scshape\relax
    \ifthenelse{\equal{\f@family}{uop}}%
    {\fontshape{sc}\selectfont}%
    {\fontshape{fsc}\selectfont}%
}

%geometry
\RequirePackage[a4paper,total={150mm,240mm}]{geometry}


%%% CAPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[font=footnotesize,labelsep=period,bf]{caption}
\setlength{\captionmargin}{15mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% COMMANDS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newboolean{@subtitle}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}\setboolean{@subtitle}{true}}

\renewcommand\abstract[1]{\def\@abstract{\\#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLE PAGE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{
    \begin{titlepage}
        \thispagestyle{empty}

%%% LOGO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        \hspace{-12mm}
        \includegraphics[width=65mm]{assets/Grid-System-USI-Software}

%%% DOCUMENT TYPE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        \vspace{10mm}
        \noindent {\large \textsc{Software \& Data Engineering Master Thesis Proposal}}

%%% AUTHOR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        \vspace{10mm}
        \noindent {\Large {\textbf{\@author}}}

%%% TITLE (& OPTIONAL SUBTITLE) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        \vspace{10mm}
        \noindent {\Large {\textsc{\@title}}}

        \ifthenelse{\boolean{@subtitle}}
        {\vspace{5mm} \noindent{\textsc{\@subtitle}}\vspace{10mm}}
        {\vspace{20mm}}

%%% ABSTRACT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        \hrule
        \vspace{5mm}
        \noindent {\textit{Abstract}}\\
        \@abstract
        \vfill
        \hrule

%%%%%%%%%%%%%%%%  ADVISOR AND ASSISTANT(S) %%%%%%%%%%%%%%%%

        \vspace{5mm}
        \noindent {\textbf{Advisor:} Prof. Dr. Cesare Pautasso}\\
        \noindent {\textbf{Co-Advisor:} Souhalia Serbout}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    \end{titlepage}

    \setcounter{footnote}{0}
}

\renewenvironment{titlepage}
{%
    \cleardoublepage
    \pagenumbering{arabic}
    \setcounter{page}\z@
    }%
    {\newpage }
{\textwidth 5cm}

%%% put ToC, LoF, LoT and Index entries in the ToC use of \phantomsection is required for dealing with the hyperref package and depends on the nohyper option

%%% other useful packages

