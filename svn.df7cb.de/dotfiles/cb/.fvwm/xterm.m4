# $Id$
dnl This file will open 4 xterms that occupy the screen neatly.
dnl For a resolution of 1024x480 (on the Sony PCG-C1VE) 2 xterms pop up.

changecom(`')dnl
# width = WIDTH, height = HEIGHT
define(_T, 0+0)dnl  place window at top
define(_B, 0-94)dnl place window at bottom

dnl jump window positions
define(JLO, `124p 0')dnl jump to left window
define(JRO, `50 0')dnl jump to right window
define(JLU, `0 45')dnl jump to left window
define(JRU, `50 45')dnl jump to right window

DestroyFunc XTermLO
DestroyFunc XTermRO
DestroyFunc XTermLU
DestroyFunc XTermRU
DestroyFunc JumpWindowLO
DestroyFunc JumpWindowRO
DestroyFunc JumpWindowLU
DestroyFunc JumpWindowRU

ifelse(
WIDTH.HEIGHT, 1024.480, `define(_LO,81x27+_T)define(_RO,82x27-_T)
			 define(_LU,81x27+_T)define(_RU,82x27-_T)',
WIDTH.HEIGHT, 1024.768, `define(_LO,81x24+_T)define(_RO,82x24-_T)
			 define(_LU,81x23+_B)define(_RU,82x23-_B)',
WIDTH.HEIGHT, 1152.864, `define(_LO,92x27+_T)define(_RO,92x27-_T)
			 define(_LU,92x27+_B)define(_RU,92x27-_B)',
WIDTH.HEIGHT, 1152.900, `define(_LO,92x28+_T)define(_RO,92x28-_T)
			 define(_LU,92x29+_B)define(_RU,92x29-_B)',
WIDTH, 1280,		`define(_LO,103x33+_T)define(_RO,103x33-_T)
			 define(_LU,103x33+0+467)define(_RU,103x33-0+467)',
WIDTH.HEIGHT, 2304.1024,`define(_LO,103x33+1024+0)define(_RO,103x33-0+0)
			 define(_LU,103x33+1024+467)define(_RU,103x33-0+467)
			 define(`JLO',`45 0')define(`JRO',`72 0')define(`JLU',`45 45')define(`JRU',`72 45')',
WIDTH, 1600,		`define(_LO,129x40+_T)define(_RO,130x40-_T)
			 define(_LU,129x40+_B)define(_RU,130x40-_B)',
			`define(_LO,80x25+_T)define(_RO,80x25-_T)
WARNING: screen size?	 define(_LU,80x25+_B)define(_RU,80x25-_B)'
)dnl

# select an xterm
AddToFunc   JumpWindowLO "I" JumpWindow JLO
AddToFunc   JumpWindowRO "I" JumpWindow JRO
AddToFunc   JumpWindowLU "I" JumpWindow JLU
AddToFunc   JumpWindowRU "I" JumpWindow JRU

AddToFunc XTermLO "I" Exec xterm -geometry _LO
+ "I"     JumpWindowLO

AddToFunc XTermRO "I" Exec xterm -geometry _RO
+ "I"     JumpWindowRO

AddToFunc XTermLU "I" Exec xterm -geometry _LU
+ "I"     JumpWindowLU

AddToFunc XTermRU "I" Exec xterm -geometry _RU
+ "I"     JumpWindowRU

AddToFunc XTerms "I" Exec xterm -geometry _LO
+		 "I" Exec xterm -geometry _RO
ifelse(HEIGHT, 480, `',
+		 "I" Exec xterm -geometry _LU
+		 "I" Exec xterm -geometry _RU
)dnl

DestroyMenu xterm
AddToMenu xterm	"xterm"		Title
ifelse(HEIGHT, 480,
`+		"2 &xterms"	Function XTerms
+		"xterm &L"	Function XTermLO
+		"xterm &R"	Function XTermRO',
`+		"4 &xterms"	Function XTerms
+		"xterm LO"	Function XTermLO
+		"xterm RO"	Function XTermRO
+		"xterm &LU"	Function XTermLU
+		"xterm &RU"	Function XTermRU'
)

ifelse(
WIDTH.HEIGHT, 2304.1024, `
define(_LLO,103x33+0+0)define(_LRO,103x33+384+0)
define(_LLU,103x33+0+467)define(_LRU,103x33+384+467)
define(`JLLO',`0 0')define(`JLRO',`20 0')define(`JLLU',`0 45')define(`JLRU',`20 45')

# select an xterm
AddToFunc   JumpWindowLLO "I" JumpWindow JLLO
AddToFunc   JumpWindowLRO "I" JumpWindow JLRO
AddToFunc   JumpWindowLLU "I" JumpWindow JLLU
AddToFunc   JumpWindowLRU "I" JumpWindow JLRU
'
)dnl

