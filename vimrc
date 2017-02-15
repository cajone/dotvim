" First the important part Pathogen !
   runtime bundle/pathogen/autoload/pathogen.vim
	execute pathogen#infect()
	syntax on
	filetype plugin indent on

	call pathogen#helptags()

" Environment Settings

	set backspace=indent,eol,start  " Backspace for dummies
	set linespace=0                 " No extra spaces between rows
	set number                      " Line numbers on
	set showmatch                   " Show matching brackets/parenthesis
	set incsearch                   " Find as you type search
	set hlsearch                    " Highlight search terms
	set winminheight=0              " Windows can be 0 line high
	set ignorecase                  " Case insensitive search
	set smartcase                   " Case sensitive when uc present
	set wildmenu                    " Show list instead of just completing
	set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
	set scrolljump=5                " Lines to scroll when cursor leaves screen
	set scrolloff=3                 " Minimum lines to keep above and below cursor
	set foldenable                  " Auto fold code
"	set list 								" set nolist hide/show hidden chars eg ^I
	set tabstop=3 						  " Tab indentation size
 	set relativenumber
"	set spell!

" Leader mapping

"   let mapleader = '\'
