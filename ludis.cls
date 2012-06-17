\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ludis}[2009/06/03 LU diplomdarbu stils]

\newcommand{\@spacingsize}{1.5}
\DeclareOption{singlespacing}{\renewcommand{\@spacingsize}{1}}
\newcommand{\@normmargins}{0}
\DeclareOption{latexmargins}{\renewcommand{\@normmargins}{1}}

\newcommand{\@fontsize}{2}
\DeclareOption{12pt}{\renewcommand{\@fontsize}{2}}
\DeclareOption{11pt}{\renewcommand{\@fontsize}{1}}
\DeclareOption{10pt}{\renewcommand{\@fontsize}{0}}

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{report}
}

\ProcessOptions\relax

\if \@fontsize 1
	\PassOptionsToClass{11pt}{report}
\else
	\if \@fontsize 0
		\PassOptionsToClass{10pt}{report}
	\else
		\PassOptionsToClass{12pt}{report}
	\fi
\fi

\LoadClass[a4paper]{report}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}

% Theorems
\numberwithin{equation}{section}
\renewcommand{\theequation}{\thesection\arabic{equation}}
\theoremstyle{definition}
\newtheorem{definicija}{Definīcija}%
\newtheorem{pienemums}{Pieņēmums}%
\newtheorem{piemers}{Piemērs}%
\theoremstyle{plain}
\newtheorem{teorema}{Teorēma}%
\newtheorem{apgalvojums}[teorema]{Apgalvojums}%
\newtheorem{lemma}[teorema]{Lemma}%
\newtheorem{sekas}[teorema]{Sekas}%
\newtheorem{piezime}[teorema]{Piezīme}
\renewcommand\proofname{Pierādījums}
\newenvironment{pieradijums}{\begin{proof}}{\end{proof}}

% Formating
\renewcommand{\baselinestretch}{\@spacingsize}
\renewcommand{\@makechapterhead}[1]{%
  \vspace*{50 pt}%
	      {\setlength{\parindent}{0pt} \raggedright \normalfont
		    \bfseries\Huge
		    \ifnum \value{secnumdepth} > 1
%%    			\if@mainmatter % This is undefined in report
                    \thechapter\ %
%%                \fi
		    \fi
		    #1\par\nobreak\vspace{40 pt}
          }
}
		
\if \@normmargins 0		
	\oddsidemargin 5mm
	\evensidemargin 0mm
	\topmargin -20mm
	\textwidth 160mm
	\textheight 248mm
\fi



% Toc
\let\@origtoc\tableofcontents
\renewcommand\tableofcontents{%
	\renewcommand{\baselinestretch}{1}
	\@origtoc
    \renewcommand{\baselinestretch}{\@spacingsize}
    }
    
% Bibliography
\newcommand{\literatura}[1]{%
	\newpage
	\renewcommand{\baselinestretch}{1}
	\bibliographystyle{ludis}
	\renewcommand{\bibname}{Izmantotā literatūra un avoti}
	\addcontentsline{toc}{chapter}{Izmantotā literatūra un avoti}\bibliography{#1}
	\renewcommand{\baselinestretch}{\@spacingsize}
}

% New commands
\newcommand{\@keywordname}{Keywords:}
\newcommand{\keywords}[1]{\par\addvspace\baselineskip\noindent\@keywordname\enspace\ignorespaces#1}
\newenvironment{abstract-en}{%
	\renewcommand{\@keywordname}{Keywords:}
	\renewcommand{\abstractname}{Abstract}
	\begin{abstract}}{\end{abstract}}
\newenvironment{abstract-lv}{%
	\renewcommand{\@keywordname}{Atslēgas vārdi:}
	\renewcommand{\abstractname}{Anotācija}
	\begin{abstract}}{\end{abstract}}

% Special sections
\newcommand{\specnodala}[1]{\newpage\addcontentsline{toc}{chapter}{#1}\section*{#1}}

% Titlepage and dokumentara lapa
\newcommand{\autors}[1]{\author{#1}}
\newcommand{\@nosaukumsLB}{0}
\newcommand{\nosaukums}[1]{%
	\title{#1}
	\if \@nosaukumsLB 0
		\renewcommand{\@nosaukumsLB}{\MakeUppercase{\@title}}
	\fi	
}
\newcommand{\NOSAUKUMS}[1]{\renewcommand{\@nosaukumsLB}{#1}}
\newcommand{\gads}[1]{\date{#1}}
\newcommand{\universityname}{Latvijas Universitāte}
\newcommand{\universityshort}{LU}
\newcommand{\@fakultate}{}
\newcommand{\@fakultateD}{}
\newcommand{\fakultate}[1]{%
	\renewcommand{\@fakultate}{#1 fakultāte}
	\renewcommand{\@fakultateD}{#1 fakultātē}}
\newcommand{\@nodala}{}
\newcommand{\@nodalaD}{}
\newcommand{\nodala}[1]{%
	\renewcommand{\@nodala}{#1 nodaļa}
	\renewcommand{\@nodalaD}{#1 nodaļā}}
\newcommand{\@vieta}{}
\newcommand{\vieta}[1]{\renewcommand{\@vieta}{#1}}
\newcommand{\@darbaveids}{}
\newcommand{\@darbaveidsLB}{0}
\newcommand{\darbaveids}[1]{%
	\renewcommand{\@darbaveids}{#1}
	\if \@darbaveidsLB 0
		\renewcommand{\@darbaveidsLB}{\MakeUppercase{\@darbaveids}}
	\fi
}
\newcommand{\DARBAVEIDS}[1]{\renewcommand{\@darbaveidsLB}{#1}}
\newcommand{\@studapl}{}
\newcommand{\studapl}[1]{\renewcommand{\@studapl}{#1}}
\newcommand{\@vaditajs}{}
\newcommand{\vaditajs}[1]{\renewcommand{\@vaditajs}{#1}}
\newcommand{\@recenzents}{}
\newcommand{\recenzents}[1]{\renewcommand{\@recenzents}{#1}}
\renewcommand{\maketitle}{%
  \renewcommand{\baselinestretch}{1}
  \begin{titlepage}%
  \null\vfil
  \begin{center}%
  	{\large \MakeUppercase{\universityname} \par}%
  	{\large \MakeUppercase{\@fakultate}\par}%
 	{\large \MakeUppercase{\@nodala} \par}%
 	\vskip 5em
    {\large \textbf{\@nosaukumsLB} \par}%
    \vskip 2em
    {\large \@darbaveidsLB\ DARBS\par}% 
   \end{center}\par
   \begin{flushright}
    \vskip 7em%
    {%
      \begin{tabular}[t]{l}%
       Autors: \textbf{\@author} \\
       Stud. apl. \@studapl \\
       Darba vadītājs: \@vaditajs
      \end{tabular}\par}%
      \vskip 1.5em%
    \end{flushright}
    \vskip 7em%
    {\centering\large \MakeUppercase{\@vieta} \@date\par}
  \vfil\null
  \end{titlepage}%
  \global\let\and\relax
   \renewcommand{\baselinestretch}{\@spacingsize}
}
   
\newcommand{\@doklapa}{%
	\newpage\thispagestyle{empty}
  	\renewcommand{\baselinestretch}{1} 
  
	\@darbaveids\ darbs ``\@title'' izstrādāts	\universityshort\ \@fakultateD.\par
	\vskip 1em%
	Ar savu parakstu apliecinu, ka pētījums veikts patstāvīgi, izmantoti tikai tajā norādītie informācijas avoti un iesniegtā darba elektroniskā kopija atbilst izdrukai.\par
	\vskip 1em
	Autors: \@author, st. apl. \@studapl\par
	\vskip 2em
	\hspace{4em}\begin{tabular}{cc}%
		\underline{\hspace{10em}}\vspace{-2mm} &
		\underline{\hspace{8em}} \\
		 \tiny{(paraksts)} &
		 \tiny{(datums)}
	\end{tabular}
	\vskip 3em%
	Rekomendēju/nerekomentēju darbu aizstāvēšanai.\par
	Vadītājs: \@vaditajs\par
	\vskip 2em
	\hspace{4em}\begin{tabular}{cc}%
		\underline{\hspace{10em}}\vspace{-2mm} &
		\underline{\hspace{8em}} \\
		 \tiny{(paraksts)} &
		 \tiny{(datums)}
	\end{tabular}
	\vskip 1em%
	\begin{tabular}{lc}
	Darbs iesniegts \@fakultateD & \underline{\hspace{8em}} \\
	& \tiny{(datums)}
	\end{tabular}\par
	\vskip 1em
	\begin{tabular}{lc}%
      Pieņēma  & \underline{\hspace{20em}}\\
		& \tiny{(darbu pieņēma)}
	\end{tabular}
	\vskip 5em%
	Darbs aizstāvēts \MakeLowercase{\@darbaveids} gala pārbaudījuma komisijas sēdē\par
	\vskip 1em%
	\begin{tabular}{cl}\underline{\hspace{8em}}\vspace{-2mm} & 	 prot.\ Nr. \underline{\hspace{4em}}, vērtējums\underline{\hspace{4em}} \\
	 \tiny{(datums)} & \end{tabular}\par
	\vskip 1em%
	\begin{tabular}{lcc}
	Komisijas sekret\={a}rs/-e: & 
	\underline{\hspace{8em}}\vspace{-2mm} &
	\underline{\hspace{8em}} \\
	& \tiny{(Vārds, Uzvārds)} & \tiny{(paraksts)} 
	\end{tabular}
}   

\AtEndDocument{\@doklapa}
