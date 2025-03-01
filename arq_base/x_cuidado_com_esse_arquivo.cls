%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ifba.cls
%%% Instituto Federal da Bahia Campus Santo Antônio de Jesus
%%% (C) 2021 Antônio Cleber de Sousa Araújo
%%% Esta classe possui permissão para ser copiada, alterada e distribuída
%%% Classe destinada a propósitos acadêmicos
%%% Classe baseada na UFPE Thesis (www.cin.ufpe.br/~paguso/ufpethesis)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Modelo de Projeto Teórico-Prático - Linguagem de Programação 2 - IFBA - Campus Euclides da Cunha
%% 
%% versao 1.0
%% 2024 Evilasio de Sousa Junior
%% https://github.com
%% Alteração do projeto Template para TCC na classe IFBATCC do Prof. Antônio Cleber de Sousa Araújo https://github.com/cleberaraujo/ifbatcc.git IFBA Santo Antõnio de Jesus
%% Alteração do projeto bare_conf de Michael Shell
%% http://www.michaelshell.org/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{x_cuidado_com_esse_arquivo}[2024/09/19]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CUIDADO AO ALTERAR ESSE ARQUIVO - PROVAVELMENTE NAO SERÁ NECESSÁRIO
%%
%% ALTERAR OS ARQUIVOS:
%% - 00_PRINCIPAL.TEX
%% - 01_INTRO.TEX (INTRODUÇÃO)
%% - 02_REVISAO_BIBLIO.TEX (REVISÃO BIBLIOGRÁFICA)
%% - 03_DESENVOLVIMENTO.TEX
%% - 04_CONCLUSAO.TEX
%% - 05_BIBLIO.BIB (REFERÊNCIAS BIBLIOGRÁFICAS - FORMATO BIBTEX
%% 
%% * ADICIONAR IMAGENS NA PASTA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OPTIONS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{pt}{%
  \let\@language=0%
  \PassOptionsToPackage{brazil}{babel}}

\DeclareOption{en}{%
  \let\@language=1%
  \PassOptionsToPackage{brazil,english}{babel}}

\DeclareOption{oneside}{%
  \PassOptionsToClass{oneside}{book}}

\DeclareOption{twoside}{%
  \PassOptionsToClass{twoside}{book}}
 
\DeclareOption{print}{%
  \let\@scr=0}

\DeclareOption{scr}{%
  \let\@scr=1%
  \PassOptionsToClass{dvipdfm}{book}}
  
\DeclareOption{tec}{%
  \let\@degreetype=0}

\DeclareOption{bsc}{%
  \let\@degreetype=1}

\DeclareOption{msc}{%
  \let\@degreetype=2}

\DeclareOption{qual}{%
  \let\@degreetype=3}

\DeclareOption{prop}{%
  \let\@degreetype=4}

\DeclareOption{phd}{%
  \let\@degreetype=5}
  
%% CURSOS
\DeclareOption{rde}{%
  \let\@coursename=0}

\DeclareOption{ads}{%
  \let\@coursename=1}
  
\DeclareOption{mul}{%
  \let\@coursename=2}

\DeclareOption{classic}{%
  \let\@style=0}
 
\DeclareOption{std}{%
  \let\@style=1
}

% Default options
\ExecuteOptions{pt,tec,rde,std,print}
\ProcessOptions

\LoadClass[12pt,a4paper]{book}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amsfonts,amssymb,amsthm}
\RequirePackage{babel}
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{textcase}
\RequirePackage{textcomp}
\RequirePackage{url}
\RequirePackage{xspace}
\RequirePackage[table,xcdraw]{xcolor}
\if\@style1
  \RequirePackage[T1]{fontenc}
  \RequirePackage{mathptmx}
  \RequirePackage[scaled=0.92]{helvet}
  \RequirePackage{courier}
\fi
\if\@scr0
  \RequirePackage{graphicx}
\fi
\if\@scr1
  \RequirePackage[dvips]{graphicx}
  \RequirePackage[dvips,usenames]{color}
  \RequirePackage[dvipdfm,colorlinks,backref]{hyperref}
\fi
\RequirePackage[alf]{abntex2cite}
%\RequirePackage{abntex2}
\RequirePackage{lastpage}
\RequirePackage[top=3cm, bottom=2cm, left=3cm, right=2cm]{geometry}
\RequirePackage{fix-cm}
\RequirePackage{color}

\graphicspath{{imagens/}}

\usepackage{quoting}
\usepackage[]{algorithm2e}
\usepackage{tabularx}
\usepackage{booktabs}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GENERAL PURPOSE MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\origcleardoublepage=\cleardoublepage
\def\cleardoublepage{%
  \newpage{\pagestyle{empty}\origcleardoublepage}
}

%%
% For use with the pseudocode package
\def\@lopcchapterspace{\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LABELS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Language Independent

\gdef\@maleadvisertitle{Orientador Prof.}
\gdef\@femaleadvisertitle{Orientadora Profa.}
\gdef\@malecoadvisertitle{Co-orientador Prof.}
\gdef\@femalecoadvisertitle{Co-orientadora Profa.}
\gdef\@tecnodissertation{}
\gdef\@bachelordissertation{Monografia}
\gdef\@mastersdissertation{Disserta\c{c}\~{a}o de Mestrado}
\gdef\@mscqualifying{Qualifica\c{c}\~{a}o de Mestrado}
\gdef\@phdproposal{Qualifica\c{c}\~{a}o de Doutorado}
\gdef\@phdthesis{Tese de Doutorado}
\gdef\@tecnodegree{Técnico}
\gdef\@bachelordegree{Bacharel}
\gdef\@mastersdegree{Mestre}
\gdef\@phddegree{Doutor}
\gdef\@malepresent{apresentado}
\gdef\@femalepresent{apresentada}
\gdef\@malejudge{julgado}
\gdef\@femalejudge{julgada}
\gdef\@maleadeq{adequado}
\gdef\@femaleadeq{adequada}
\gdef\@maleapprovate{aprovado}
\gdef\@femaleapprovate{aprovada}
\gdef\@rdecourse{Informática}
\gdef\@adscourse{Análise e Desenvolvimento de Sistemas}
\gdef\@mulcourse{Produção Multimídia}
\gdef\@presentationtext{}
\gdef\resumoname{Resumo}
\gdef\abstrname{Abstract}
\gdef\keywordsnamePT{Palavras-chave}
\gdef\keywordsnameEN{Keywords}

%% Language Dependent

% Portuguese
\if\@language0
  \gdef\@notdefined{N\~{A}O DEFINIDO}
  \gdef\acknowledgementsname{AGRADECIMENTOS}
  \gdef\@axiomname{Axioma}
  \gdef\@conjecturename{Conjectura}
  \gdef\@defname{Defini\c{c}\~{a}o}
  \gdef\@lemmaname{Lema}
  \gdef\@theoname{Teorema}
  \gdef\@propname{Proposi\c{c}\~{a}o}
  \gdef\@corname{Corol\'{a}rio}
  \gdef\@proofname{Prova}
  \gdef\@figurename{Figura}
  \gdef\@tablename{Tabela}
  \gdef\@equationame{equa\c{c}\~{a}o}
  \gdef\@chaptername{Cap\~{i}tulo}
  \gdef\@sectionname{Se\c{c}\~{a}o}
  \gdef\@appendixname{Ap\^{e}ndice}
  \gdef\@pagename{p\'{a}gina}
  \gdef\@colophontext{%
  \urlstyle{rm}%
  Este volume foi tipografado em \LaTeX\ na classe \textsf{IFBATCC}
  (\url{https://github.com/cleberaraujo/ifbatcc}).
  \if\@scr1
  Para detalhes sobre este documento, clique \Acrobatmenu{GeneralInfo}{aqui}.
  \fi}
% English
\else\if\@language1
  \gdef\@notdefined{UNDEFINED}
  \gdef\acknowledgementsname{Acknowledgements}
  \gdef\@axiomname{Axiom}
  \gdef\@conjecturename{Conjecture}
  \gdef\@defname{Definition}
  \gdef\@lemmaname{Lemma}
  \gdef\@theoname{Theorem}
  \gdef\@propname{Proposition}
  \gdef\@corname{Corollary}
  \gdef\@proofname{Proof}
  \gdef\@figurename{Figure}
  \gdef\@tablename{Table}
  \gdef\@equationame{equation}
  \gdef\@chaptername{Chapter}
  \gdef\@sectionname{Section}
  \gdef\@appendixname{Appendix}
  \gdef\@pagename{page}
  \gdef\@colophontext{%
  \urlstyle{rm}%
  This volume has been typeset in \LaTeX with the \textsf{IFBATCC} class
  (\url{https://github.com/cleberaraujo/ifbatcc.git}).
  \if\@scr1
  For details about this document, click \Acrobatmenu{GeneralInfo}{here}. 
  \fi}
\fi\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IDENTIFICATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% School identification

\def\ifba#1{%
  \gdef\@ifba{#1}}
\def\@ifba{Instituto Federal de Educação, Ciência e Tecnologia da Bahia}

\let\@showinstitute=0
\def\institute#1{%
  \let\@showinstitute=1
  \gdef\@institute{#1}}
\institute{Campus Euvlides da Cunha}

\def\program#1{%
  \gdef\@program{#1}}
\def\@program{\@notdefined}
\program{Instituto Federal de Educação, Ciência e Tecnologia da Bahia}

\def\majorfield#1{%
  \gdef\@majorfield{#1}}
\def\@majorfield{\@notdefined}
\majorfield{Teste Redes de Computadores}

\def\address#1{%
  \gdef\@address{#1}}
\def\@address{Euclides da Cunha}

\def\address#1{%
  \gdef\@ano{#1}}
\def\@ano{2025}
%% Authors identification

\def\author#1{%
  \gdef\@author{#1}
  \if\@scr1 \hypersetup{pdfauthor={\@author}}\fi}
\def\@author{\@notdefined}

\def\institute#1{%
  \gdef\@instituto{#1}
  \if\@institute \hypersetup{pdfinstitute={\@institute}}\fi}
\def\@institute{\@notdefined}

\def\adviser{%
  \@ifnextchar [%
    {\@padviser}%
    {\@padviser[\@empty]}}
\def\@padviser[#1]#2{%
  \ifx#1\@empty
    \gdef\@advisertitle{\@maleadvisertitle}
  \else
    \gdef\@advisertitle{\@femaleadvisertitle}
  \fi
  \gdef\@adviser{#2}}
\def\@adviser{\@notdefined}

\let\@showcoadviser=0
\def\coadviser{%
  \@ifnextchar [%
    {\@pcoadviser}%
    {\@pcoadviser[\@empty]}}
\def\@pcoadviser[#1]#2{%
  \let\@showcoadviser=1
  \ifx#1\@empty
    \gdef\@coadvisertitle{\@malecoadvisertitle}
  \else
    \gdef\@coadvisertitle{\@femalecoadvisertitle}
  \fi
  \gdef\@coadviser{#2}}

\def\texttype{%
  \gdef\@texttype}
\def\@texttype{\@texttype}

%% Work identification

\def\title#1{%
  \gdef\@title{#1}
  \if\@scr1 \hypersetup{pdftitle={\@title}}\fi}
\def\@title{\@notdefined}

\def\@texttype{%
  \if\@degreetype0
    \@tecnodissertation
  \else\if\@degreetype1
    \@bachelordissertation
  \else\if\@degreetype2
    \@mastersdissertation
  \else\if\@degreetype3
    \@mscqualifying
  \else\if\@degreetype4
    \@phdproposal
  \else\if\@degreetype5
    \@phdthesis
  \fi\fi\fi\fi\fi\fi}

\def\@degree{%
  \if\@degreetype0
    \@tecnodegree
  \else\if\@degreetype1
    \@bachelordegree
  \else\if\@degreetype2
    \@mastersdegree
  \else\if\@degreetype3
    \@mastersdegree
  \else\if\@degreetype4
    \@phddegree
  \else\if\@degreetype5
    \@phddegree
   \fi\fi\fi\fi\fi\fi}
  
\def\@courses{%
  \if\@coursename0
    \@rdecourse
  \else\if\@coursename1
    \@adscourse
  \else\if\@coursename2
    \@mulcourse
  \fi\fi\fi}
  
\def\@presentation{%
  \if\@degreetype0
    \@malepresent
  \else\
    \@femalepresent
  \fi}

\def\@judge{%
  \if\@degreetype0
    \@malejudge
  \else\
    \@femalejudge
  \fi}
  
\def\@adequate{%
  \if\@degreetype0
    \@maleadeq
  \else\
    \@femaleadeq
  \fi}
  
\def\@approvates{%
  \if\@degreetype0
    \@maleapprovate
  \else\
    \@femaleapprovate
  \fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\topmargin}{0mm}
\setlength{\textheight}{\paperheight-\headheight-\headsep-\footskip-2in}
\setlength{\marginparwidth}{0mm}
\setlength{\marginparsep}{0mm}
\setlength{\textwidth}{\paperwidth-2in}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%         CLASSIC STYLE            %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if\@style0


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\font\quotefont=cmssq8 scaled\magstep1
\font\quotefonti=cmssqi8 scaled\magstep1


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Capa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\ifbacapa{%
 \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \begin{center}
    \includegraphics[scale=0.3]{logo_ifba.png}
    \\
  \sf\large
  \vskip 5mm
  \textbf{%
    INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E \\
    TECNOLOGIA DA BAHIA CAMPUS EUCLIDES DA CUNHA 
  }
  \vskip 15mm
  \textbf{%
    CURSO TÉCNICO EM INFORMÁTICA – INTEGRADO
  }
  \vskip 25mm
  %\textbf{\MakeTextUppercase{\@texttype}}
  %\vskip 25mm
  \begin{minipage}{150mm}
    \begin{center}
      \textbf{\@author}
      \vskip 25mm
      \textbf{\@title}
      \vskip\baselineskip
      
      %\textbf{Curso Superior de Tecnologia em\\ \@courses\/}
      \vskip\baselineskip
      \vskip 55mm
         
      
      \@address\\
      \@ano\\
      %\@date
    \end{center}
  \end{minipage}\\
  %\vfill
  \end{center}
  %\begin{flushright}
  %\sf\large
  %#1
  %\end{flushright}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Página de Apresentação
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\ifbacontracapa{%
    
  %\if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \begin{center}
     \sf\large
      \vskip 5mm
      \textbf{%
        INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E \\
        TECNOLOGIA DA BAHIA CAMPUS EUCLIDES DA CUNHA 
      }
      \vskip 25mm
      {\sf\MakeTextUppercase{\@author}}
      \vskip 25mm
      {\sf\textbf{\MakeTextUppercase{\@title}}}
      \vskip 25mm
      \begin{flushright}
            \begin{minipage}{0.5\textwidth}
                    \@texttype apresentado ao Instituto Federal de
                    Educação, Ciência e Tecnologia da Bahia
                    \textit{-} Campus Euclides da Cunha, como requisito parcial para obtenção do
                    grau de \@degree\ em \@courses\/.
            
                \sf
            
                {\@advisertitle:} \@adviser
                \if\@showcoadviser1
                  \\ {\@coadvisertitle:} \@coadviser
                \fi
            \end{minipage}
      \end{flushright}
        \vskip 15mm
      \vfill
      \sf
      \@address\\
      \@ano
  \end{center}

}


%% Cataloging Sheet (``termo de aprovacao'')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\approvalsheet#1#2{%
  \newpage
  \thispagestyle{empty}
  \begin{center}
     \sf\large
      \vskip 5mm
      \textbf{%
        INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E \\
        TECNOLOGIA DA BAHIA CAMPUS EUCLIDES DA CUNHA 
      }
      \vskip 15mm
    {\sf\large \textbf{FOLHA DE APROVA\c{C}\~{A}O}}

    \vspace{2em}
    {\sf\large\textbf{\MakeUppercase{\@author}}}

    \vspace{3em}
    \begin{minipage}{1\textwidth}
      \centering
      \sf\large\textbf{\MakeUppercase{\@title}}
    \end{minipage}

    \vspace{2em}
    \begin{flushright}
      \begin{minipage}{0.5\textwidth}
        Este \@texttype\ foi  aprovado como requisito parcial à obtenção do título de \@degree\ de nível médio em\@courses\ do Instituto Federal da Bahia, \textit{campus} Euclides da Cunha, pela seguinte Banca examinadora:
      \end{minipage}
    \end{flushright}



    \begin{minipage}{0.6\textwidth}
      \centering
      {#2}
    \end{minipage}

    \vspace{1em}
    \begin{center}
      {#1}
    \end{center}
    
    \vfill
  \end{center}
}
\def\comittemember#1#2{%
  \vspace{2em}
  \hrule
		\vspace{0.25em}
		{#1}\\{#2}\\
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dedicatory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\dedicatory{%
  %\if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  ~\\
  \vfill
  \begin{flushright}
    \begin{minipage}{100mm}
    \quotefonti}
\def\enddedicatory{
    \normalfont
    \end{minipage}
  \end{flushright}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Acknowledgements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \def\acknowledgements{%
%     \thispagestyle{empty}
%   \chapter*{}

% }

\def\agradecimentos#1{%
  \newpage
  \thispagestyle{empty}
  \begin{center}
     \sf\large
      \vskip 5mm
      \textbf{%
        \acknowledgementsname
      }
      \vskip 15mm
  
    \vspace{1em}
    \begin{center}
      {#1}
    \end{center}
    
    \vfill
  \end{center}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Resumo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\resumo{%
  \gdef\@keywordsname{\keywordsnamePT}
  \chapter*{\resumoname}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\abstract{%
  \gdef\@keywordsname{\keywordsnameEN}
  \chapter*{\abstrname}}

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Keywords
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@keywordsname{\@defaultkeywordsname}
\def\keywords{%
  \par\vskip\baselineskip\noindent{\bf\@keywordsname: }}
\def\endkeywords{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Quotations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \def\epigraph{%
%   %\if@openright\cleardoublepage\else\clearpage\fi
%   \thispagestyle{empty}
%   ~\\\vfill
%   \begin{quotation}}
% \def\endepigraph{\end{quotation}}

% \def\quotation{%
%   \@ifnextchar [%
%     {\begin{pquot@tion}}%
%     {\begin{pquot@tion}[\@empty]}}
% \def\endquotation{\end{pquot@tion}\@afterindentfalse}

% \def\pquot@tion[#1]#2{%
%   \gdef\@qauthor{#2}
%   \gdef\@qnote{#1}
%   \begin{flushright}
%     \begin{minipage}{0.8\textwidth}
%       \begin{flushright}\quotefonti}
% \def\endpquot@tion{%
%         \vskip.2\baselineskip%
%         \quotefont---\MakeTextUppercase{\@qauthor}
%         \if\@qnote\@empty
%           \relax
%         \else
%           \space(\@qnote)
%         \fi
%       \end{flushright}
%     \end{minipage}
%   \end{flushright}
%   \normalfont\vskip\baselineskip}

\def\epigraph{%
  % \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  ~\\\vfill
  \begin{quotation}}
\def\endepigraph{\end{quotation}}

\def\quotation{%
  \@ifnextchar [%
    {\begin{pquot@tion}}%
    {\begin{pquot@tion}[\@empty]}}
\def\endquotation{\end{pquot@tion}\@afterindentfalse}

\def\pquot@tion[#1]#2{%
  \gdef\@qauthor{#2}
  \gdef\@qnote{#1}
  \begin{flushright}
    \begin{minipage}{0.8\textwidth}
      \begin{flushright}\quotefonti}
\def\endpquot@tion{%
        \vskip.2\baselineskip%
        \quotefont---\MakeTextUppercase{\@qauthor}
        \if\@qnote\@empty
          \relax
        \else
          \space(\@qnote)
        \fi
      \end{flushright}
    \end{minipage}
  \end{flushright}
  \normalfont\vskip\baselineskip}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\tableofcontents{%
  \chapter*{\contentsname}
  \thispagestyle{empty}
  \@starttoc{toc}}

\def\l@part#1#2{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large\sf\bfseries #1\hfil \hb@xt@\@pnumwidth{\hss}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\def\l@chapter#1#2{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode %\sffamily\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      %\vskip .1\baselineskip
	  {\sffamily\bfseries #1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
	  \vskip .6\baselineskip
      \penalty\@highpenalty
    \endgroup
  \fi}

\setcounter{tocdepth}{4}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sectioning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{4}

\def\part{%
  %\if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}%
  \secdef\@part\@spart}
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \null\vfil
     \ifnum \c@secnumdepth >-2\relax
       \Large\sf \MakeTextUppercase{\partname\nobreakspace\thepart}
       \par
       \vskip 20\p@
     \fi
     \huge\bfseries\MakeTextUppercase{#2}\par}
     \vfil}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \null\vfil
     \huge\sf\bfseries\MakeTextUppercase{#1}\par}
     \vfil}

\def\chapter{\if@openright\cleardoublepage\else\clearpage\fi
             \thispagestyle{plain}%
             \global\@topnum\z@
             \@afterindentfalse
             \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{
   \refstepcounter{chapter}%
   \addcontentsline{toc}{chapter}{\chaptername~\thechapter---#1}%
   \chaptermark{#1}%
   \addtocontents{lof}{\protect\addvspace{10\p@}}%
   \addtocontents{lot}{\protect\addvspace{10\p@}}%
   \@lopcchapterspace%
   \@makechapterhead{#2}%
   \@afterheading}

\def\@makechapterhead#1{%
  {\noindent\sffamily\large\MakeTextUppercase{\chaptername~\thechapter}}%
  \vskip 2\baselineskip%
  {\begin{flushright}\Large\sffamily\bfseries\MakeTextUppercase{#1}\end{flushright}}%
  \vskip 1.5\baselineskip}

\def\@schapter#1{%
  \chaptermark{#1}%
  \@makeschapterhead{#1}%
  \@afterheading}

\def\@makeschapterhead#1{%
  {\noindent\sffamily\large\MakeTextUppercase{~}}%
  \vskip 2\baselineskip%
  {\begin{flushright}\Large\sffamily\bfseries\MakeTextUppercase{#1}\end{flushright}}
  \vskip 1.5\baselineskip}

\def\appendix{%
   \setcounter{chapter}{0}%
   \renewcommand{\thechapter}{\Alph{chapter}}%
   \renewcommand{\chaptername}{\appendixname}
	 \renewcommand{\theequation}{\thechapter.\oldstylenums{\arabic{equation}}}
}

\def\@startsection#1#2#3#4#5#6{%
 \if@noskipsec \leavevmode \fi
 \par \@tempskipa #4\relax
 \@afterindentfalse
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
 \@ifstar{\@dblarg{\@sect{#1}{\@m}{#3}{#4}{#5}{#6}}}%
         {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}%
}

\def\section{%
  \@startsection{section}{1}{0mm}{\baselineskip}
    {.625\baselineskip}{\sffamily\bfseries\MakeTextUppercase}}

\def\subsection{%
  \@startsection{subsection}{2}{0mm}{\baselineskip}
    {.6\baselineskip}{\sffamily\bfseries}}

\def\subsubsection{%
  \@startsection{subsubsection}{3}{0mm}{1.2\baselineskip}
   {-1em}{\rm\bfseries}}

\def\paragraph{%
  \@startsection{paragraph}{4}{0mm}{\baselineskip}
   {-1em}{\itshape}}

\def\colophon{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \null\vfill
  \small\noindent\@colophontext
}

\def\xchapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@xchapter\@schapter}

\def\@xchapter[#1]#2#3{
   \refstepcounter{chapter}%
   \addcontentsline{toc}{chapter}{\chaptername~\thechapter---#1}%
   \chaptermark{#1}%
   \addtocontents{lof}{\protect\addvspace{10\p@}}%
   \addtocontents{lot}{\protect\addvspace{10\p@}}%
   \@lopcchapterspace%
   \@makexchapterhead{#2}{#3}%
   \@afterheading
   }

\definecolor{ifbachapterbgcolor}{rgb}{0.8,0.8,0.8}
\def\@makexchapterhead#1#2{%
  \begin{flushright}
    \colorbox{ifbachapterbgcolor}{
      \begin{minipage}{0.2\textwidth}
        \begin{center}
        \vspace{0.5\baselineskip}
        {\sffamily\bfseries \fontsize{18pt}{18pt}\selectfont \textbf{\chaptername}} \\
        \vspace{0.5\baselineskip}
    {\sffamily\bfseries \fontsize{98pt}{98pt}\selectfont \color{white}{\textbf{\thechapter}}} \\ \vspace{0.5\baselineskip}
         \end{center}
      \end{minipage}
    }
  \end{flushright}
  \vskip 2\baselineskip%
  {\noindent\itshape\footnotesize #2}
  \vskip 0.5\baselineskip%
  {\begin{flushright}\sffamily\Large\bfseries\MakeUppercase{#1}\end{flushright}}%
  \vskip 1.5\baselineskip
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headers & footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\chaptermark#1%
{\markboth{\normalfont\footnotesize\MakeTextUppercase{#1}}%
{\normalfont\scriptsize\MakeTextUppercase{#1}}}

\def\schaptermark#1%
{\markboth{\normalfont\footnotesize\MakeTextUppercase{#1}}%
{\normalfont\scriptsize\MakeTextUppercase{#1}}}

\def\sectionmark#1%
{\markright{\normalfont\footnotesize\MakeTextUppercase{\thesection\ #1}}}

%\def\chaptermark#1{\markboth{\sc\MakeLowercase{#1}}{\sc\MakeLowercase{#1}}}
%\def\sectionmark#1{\markright{\sc\MakeLowercase{\thesection\ #1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\global\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tables and figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\small\bf #1\rm\enskip #2}%
  \ifdim \wd\@tempboxa >\hsize
    {\small\bf#1\rm\enskip #2\par}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mathematics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Equation numbering
\renewcommand{\theequation}{\oldstylenums{\thechapter}.\oldstylenums{\arabic{equation}}}

% Theorem-like environments
\newtheoremstyle{theo}%
	{\topsep}{\topsep}% Space above and below
	{\slshape}% Body style
	{0pt}% Heading indent amount
	{\bfseries}{.}% Heading font and punctuation after it
	{1ex plus 0pt minus .2ex}% Space after heading 
	{}% Head spec (empty = same as "plain" style
\theoremstyle{definition}
\newtheorem{Def}{\@defname}[chapter]
\theoremstyle{theo}
\newtheorem{Axi}{\@axiomname}[chapter]
\newtheorem{Conj}{\@conjecturename}[chapter]
\newtheorem{Lem}{\@lemmaname}[chapter]
\newtheorem{Theo}{\@theoname}[chapter]
\newtheorem{Prop}{\@propname}[chapter]
\newtheorem{Cor}{\@corname}[chapter]
\renewcommand{\qedsymbol}{\rule{3pt}{8pt}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reference macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\figref}[2][]{\@figurename~\ref{#2}#1\xspace}
\newcommand{\tabref}[1]{\@tablename~\ref{#1}\xspace}
\newcommand{\eqnref}[1]{\@equationame~\eqref{#1}\xspace}
\newcommand{\chapref}[1]{\@chaptername~\ref{#1}\xspace}
\newcommand{\secref}[1]{\@sectionname~\ref{#1}\xspace}
\newcommand{\appref}[1]{\@appendixname~\ref{#1}\xspace}
\newcommand{\axiref}[1]{\@axiomname~\ref{#1}\xspace}
\newcommand{\conjref}[1]{\@conjname~\ref{#1}\xspace}
\newcommand{\defref}[1]{\@defname~\ref{#1}\xspace}
\newcommand{\lemref}[1]{\@lemmaname~\ref{#1}\xspace}
\newcommand{\theoref}[1]{\@theoname~\ref{#1}\xspace}
\newcommand{\corref}[1]{\@corname~\ref{#1}\xspace}
\newcommand{\propref}[1]{\@propname~\ref{#1}\xspace}
\newcommand{\pgref}[1]{\@pagename~\pageref{#1}\xspace}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%         STANDARD STYLE           %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\else\if\@style1


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\quotefont{\normalfont\normalsize}
\newcommand\quotefonti{\it\normalsize}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dedicatory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\dedicatory{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  ~\\
  \vfill
  \begin{flushright}
    \begin{minipage}{100mm}
    \quotefonti
    \begin{flushright}}
\def\enddedicatory{
		\end{flushright}
    \normalfont
    \end{minipage}
  \end{flushright}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Acknowledgements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \def\acknowledgements{%

%   \chapter*{\acknowledgementsname}
%   }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Resumo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\resumo{%
    
  \gdef\@keywordsname{\keywordsnamePT}
  \chapter*{\resumoname}
  }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Quotations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\epigraph{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  ~\\\vfill
  \begin{quotation}}
\def\endepigraph{\end{quotation}}

\def\quotation{%
  \@ifnextchar [%
    {\begin{pquot@tion}}%
    {\begin{pquot@tion}[\@empty]}}
\def\endquotation{\end{pquot@tion}\@afterindentfalse\@afterheading}

\def\pquot@tion[#1]#2{%
  \def\@qauthor{#2}
  \def\@qnote{#1}
  \begin{flushright}
    \begin{minipage}{0.8\textwidth}
      \begin{flushright}\quotefonti}
\def\endpquot@tion{%
        \vskip.2\baselineskip%
        \quotefont---\MakeTextUppercase{\@qauthor}
        \if\@qnote\@empty
          \relax
        \else
          \space(\@qnote)
        \fi
      \end{flushright}
    \end{minipage}
  \end{flushright}
  \normalfont\vskip2\baselineskip}

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@plaintocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}

 \renewcommand\tableofcontents{%
   \chapter*{\contentsname}
   \@starttoc{toc}}
 

% \def\l@part#1#2{%
%   \ifnum \c@tocdepth >-2\relax
%     \addpenalty{-\@highpenalty}%
%     \addvspace{2.25em \@plus\p@}%
%     \setlength\@tempdima{3em}%
%     \begingroup
%       \parindent \z@ \rightskip \@pnumwidth
%       \parfillskip -\@pnumwidth
%       {\leavevmode
%        \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
%        \nobreak
%          \global\@nobreaktrue
%          \everypar{\global\@nobreakfalse\everypar{}}%
%     \endgroup
%   \fi}

\def\l@chapter#1#2{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip .75em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
    %\vskip .75em \@plus\p@
  \fi}

%\def\l@section{\@plaintocline{1}{1.5em}{2.3em}}
%\def\l@subsection{\@plaintocline{2}{3.8em}{3.2em}}
%\def\l@subsubsection{\@plaintocline{3}{7.0em}{4.1em}}
%\def\l@paragraph{\@plaintocline{4}{10em}{5em}}
%\def\l@subparagraph{\@plaintocline{5}{12em}{6em}}
%
%\def\l@figure{\@plaintocline{1}{1.5em}{2.3em}}
%\def\l@table{\@plaintocline{1}{1.5em}{2.3em}}
\let\@dottedtocline\@plaintocline

\setcounter{tocdepth}{3}


\renewcommand\listoffigures{%
   \chapter*{\listfigurename}
   \@starttoc{lof}}

\renewcommand\listoftables{%
   \chapter*{\listtablename}
   \@starttoc{lot}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sectioning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{4}

\def\part{%
	\if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}%
  \secdef\@part\@spart}
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \null\vfil
     \ifnum \c@secnumdepth >-2\relax
       {\sc\Large\partname\nobreakspace\thepart}
       \par
       \vskip 20\p@
     \fi
     {\huge\bfseries #2\par}}
     \vfil}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \null\vfil
     {\huge\bfseries #1\par}}
     \vfil}

\def\chapter{\if@openright\cleardoublepage\else\clearpage\fi
             \thispagestyle{plain}%
             \global\@topnum\z@
             \@afterindentfalse
             \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{
   \refstepcounter{chapter}%
   \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
   \chaptermark{#1}%
   \addtocontents{lof}{\protect\addvspace{10\p@}}%
   \addtocontents{lot}{\protect\addvspace{10\p@}}%
   \@lopcchapterspace%
   \@makechapterhead{#2}%
   \@afterheading}

\def\@makechapterhead#1{\global\topskip 1.5pc
  \relax
  \begingroup
  \LARGE\bfseries\centering
    \ifnum\c@secnumdepth>\m@ne
      \leavevmode \hskip-\leftskip
      \rlap{\vbox to\z@{\vss
          \centerline{\large\sc{\chaptername}\enspace\thechapter}
          \vskip2.5pc}}\hskip\leftskip\fi
     #1\par \endgroup
  \skip@10pc \advance\skip@-\normalbaselineskip
  \vskip\skip@ }  
  
\def\@schapter#1{%
  \schaptermark{#1}%
  \@makeschapterhead{#1}%
  \@afterheading}

\def\@makeschapterhead#1{\global\topskip 1.5pc\relax
  \begingroup
  \LARGE\bfseries\centering
  #1\par \endgroup
  \skip@10pc \advance\skip@-\normalbaselineskip
  \vskip\skip@ }

\def\appendix{%
   \setcounter{chapter}{0}%
   \renewcommand{\thechapter}{\Alph{chapter}}%
   \renewcommand{\chaptername}{\appendixname}}

\def\@startsection#1#2#3#4#5#6{%
 \if@noskipsec \leavevmode \fi
 \par \@tempskipa #4\relax
 \@afterindentfalse
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
 \@ifstar{\@dblarg{\@sect{#1}{\@m}{#3}{#4}{#5}{#6}}}%
         {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}%
}

\def\section{%
  \@startsection{section}{1}{0mm}{1.5\baselineskip}
    {\baselineskip}{\centering\large\bfseries}}

\def\subsection{%
  \@startsection{subsection}{2}{0mm}{1.2\baselineskip}
    {.6\baselineskip}{\centering\bfseries}}

\def\subsubsection{%
  \@startsection{subsubsection}{3}{0mm}{\baselineskip}
   {.6\baselineskip}{\centering\normalfont}}

\def\paragraph{%
  \@startsection{paragraph}{4}{0mm}{\baselineskip}
   {-1em}{\itshape}}

\def\colophon{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \null\vfill
  \small\noindent
  \@colophontext	
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headers & footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@evenhead{\rlap{\thepage}\hfill{\leftmark}\hfill}%
\def\@oddhead{\hfill{\rightmark}\hfill\llap{\thepage}}%

\def\chaptermark#1%
{\markboth{\normalfont\footnotesize\MakeTextUppercase{\chaptername~\thechapter\enspace#1}}%
{\normalfont\footnotesize\MakeTextUppercase{\chaptername~\thechapter\enspace#1}}}

\def\schaptermark#1%
{\markboth{\normalfont\footnotesize\MakeTextUppercase{#1}}%
{\normalfont\footnotesize\MakeTextUppercase{#1}}}

\def\sectionmark#1%
{\markright{\normalfont\footnotesize\MakeTextUppercase{\thesection\enspace #1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\global\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tables and figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\small\bf #1\rm\enskip #2}%
  \ifdim \wd\@tempboxa >\hsize
    {\small\bf#1\rm\enskip #2\par}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mathematics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Equation numbering
\renewcommand{\theequation}{\rm\thechapter.\arabic{equation}}

% Theorem-like environments
\newtheoremstyle{theo}%
	{\topsep}{\topsep}% Space above and below
	{\slshape}% Body style
	{0pt}% Heading indent amount
	{\bfseries}{.}% Heading font and punctuation after it
	{1ex plus 0pt minus .2ex}% Space after heading 
	{}% Head spec (empty = same as "plain" style
\theoremstyle{definition}
\newtheorem{Def}{\@defname}[chapter]
\theoremstyle{theo}
\newtheorem{Axi}{\@axiomname}[chapter]
\newtheorem{Conj}{\@conjecturename}[chapter]
\newtheorem{Lem}{\@lemmaname}[chapter]
\newtheorem{Theo}{\@theoname}[chapter]
\newtheorem{Prop}{\@propname}[chapter]
\newtheorem{Cor}{\@corname}[chapter]
%\renewcommand{\qedsymbol}{\rule{3pt}{8pt}}
%\renrewcommand{\proofname}{\@proofname}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reference macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\figref}[2][]{\@figurename~\ref{#2}#1\xspace}
\newcommand{\tabref}[1]{\@tablename~\ref{#1}\xspace}
\newcommand{\eqnref}[1]{\@equationame~\eqref{#1}\xspace}
\newcommand{\chapref}[1]{\@chaptername~\ref{#1}\xspace}
\newcommand{\secref}[1]{\@sectionname~\ref{#1}\xspace}
\newcommand{\appref}[1]{\@appendixname~\ref{#1}\xspace}
\newcommand{\axiref}[1]{\@axiomname~\ref{#1}\xspace}
\newcommand{\conjref}[1]{\@conjname~\ref{#1}\xspace}
\newcommand{\defref}[1]{\@defname~\ref{#1}\xspace}
\newcommand{\lemref}[1]{\@lemmaname~\ref{#1}\xspace}
\newcommand{\theoref}[1]{\@theoname~\ref{#1}\xspace}
\newcommand{\corref}[1]{\@corname~\ref{#1}\xspace}
\newcommand{\propref}[1]{\@propname~\ref{#1}\xspace}
\newcommand{\pgref}[1]{\@pagename~\pageref{#1}\xspace}

\fi\fi
