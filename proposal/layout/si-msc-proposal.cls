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

%\RequirePackage{listings}

%\RequirePackage{subcaption}

%\captionsetup{labelfont={bf}}
%\usepackage{subcaption}
%\usepackage{listings}

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

%%datatool
%\RequirePackage{datatool}
%\RequirePackage{calc}
%
%%commands to print empty values in the database 
%\newcommand{\print@blank}[1]{\ifthenelse{\equal{#1}{!blank!}}{}{#1\ }}
%\newcommand{\print@empty}[1]{\ifthenelse{\equal{#1}{!blank!}}{}{#1}}
%
%%%% populate the committee database
%%%% format of the rows (name of the columns in brackets) :
%%%% Title [title], First and Middle [first], Last [last], Affiliation [aff], Type ([a]dvisor, phd [d]irector, [i]nternal) [type]
%\newenvironment{committee}{%
%\DTLnewdb{committee}
%}%
%{%
%\DTLsort{type,last,first}{committee}
%}
%
%\newcounter{advisors}
%\newcommand*{\advisor}[4][Universit\`a della Svizzera Italiana, Switzerland]{%
%\DTLnewrow{committee}
%\ifthenelse{\isempty{#2}}{\DTLnewdbentry{committee}{title}{!blank!}}{%
%\DTLnewdbentry{committee}{title}{#2}}
%\DTLnewdbentry{committee}{first}{#3}
%\DTLnewdbentry{committee}{last}{#4}
%\DTLnewdbentry{committee}{aff}{#1}
%\DTLnewdbentry{committee}{type}{r}
%\stepcounter{advisors}
%}
%
%\newcounter{coadvisors}
%\newcommand*{\coadvisor}[4][Universit\`a della Svizzera Italiana, Switzerland]{%
%\DTLnewrow{committee}
%\ifthenelse{\isempty{#2}}{\DTLnewdbentry{committee}{title}{!blank!}}{%
%\DTLnewdbentry{committee}{title}{#2}}
%\DTLnewdbentry{committee}{first}{#3}
%\DTLnewdbentry{committee}{last}{#4}
%\DTLnewdbentry{committee}{aff}{#1}
%\DTLnewdbentry{committee}{type}{a}
%\stepcounter{coadvisors}
%}

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

%\noindent\textsf{\textbf{Advisors}~} \\
%\DTLforeach*[\DTLiseq{\type}{r}]{committee}
%{\actitle=title,\first=first,\last=last,\type=type}{
%\hspace{-0.1cm}\textsf{\print@blank{\actitle}\first \ \last~}%
%}
%\ifthenelse{\value{coadvisors} > 0}{\hfill \textsf{\textbf{\\Co-advisor}\ifthenelse{\value{coadvisors} > 1}{\textsf{\textbf{s}}{}}}}{}\\
%\DTLforeach*[\DTLiseq{\type}{a}]{committee}%
%{\actitle=title,\first=first,\last=last,\type=type}{\DTLiffirstrow{}{, }\textsf{\print@blank{\actitle}\first \ \last}%
%}

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

