set history=100000		" keep 50 lines of command line history
set cwh=20
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set ic is hls
set nobackup
set wildmenu
set wildmode=longest:full,full
set number
set list
"set listchars=eol:<,tab:>-,trail:_,extends:-,precedes:<
set notitle
if version >= 700
	set listchars=eol:<,tab:>-,trail:_,extends:-,precedes:<,nbsp:%
endif

if version >= 704
	set noudf
endif
