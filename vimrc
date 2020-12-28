" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }
    " Basics {
      " Assume a .vimrc file exists so no need for
      " set nocompatible        " Must be first line ( turns off Vi compatibility )
          if !WINDOWS()
              set shell=/bin/bash
          endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME
        endif
    " }

    " Set the Gvim gui size {
        if has("gui_running")
        " GUI is running or is about to start.
        " 'Maximize' gvim window.
            set lines=999 columns=999
        endif
    " }

    " Arrow Key Fix {
        if &term[:3] == 'rxvt' || &term[:4] == "xterm" || &term[:5] == 'screen'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }

    "Global cut and paste mapped to y & p
    set clipboard+=unnamed

" }  // End of Environment

" First the important part Pathogen ! {
    runtime bundle/pathogen/autoload/pathogen.vim
    execute pathogen#infect()
    syntax on
    filetype plugin indent on
" } // End of Pathogen


" Plugin Key Mappings {
    " Airline Theme
        let g:airline_theme='base16'
        set laststatus=2 					    " Get instant feeback from airline
        let g:airline#extensions#tagbar#enabled = 1

    " Tagbar
        nmap <F8> :TagbarToggle<CR>

    " Vim-Chef
        autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

    " Vim-Inspec
        autocmd FileType ruby set filetype=ruby.inspec
        au BufRead,BufNewFile *_test.rb set syntax=ruby.inspec

    " Ctrlp
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_show_hidden = 1             " Show dotfiles

    " Solarized
        set t_Co=256
        let g:solarized_termcolors=256
        "let g:solarized_termcolors=256

    " Arduino
        let g:arduino_cmd = '/usr/bin/arduino'                      "Runtime Path
        let g:arduino_dir = '/usr/share/arduino'                    "Arduino home dir
        let g:arduino_board = 'arduino:avr:uno'                     "Your Arduino type
        nnoremap <buffer> <leader>am :ArduinoVerify<CR>
        nnoremap <buffer> <leader>au :ArduinoUpload<CR>
        nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
        nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
        nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

    " Gitgutter
      " Use fontawesome icons as signs
        let g:gitgutter_sign_added = '+'
        let g:gitgutter_sign_modified = '>'
        let g:gitgutter_sign_removed = '-'
        let g:gitgutter_sign_removed_first_line = '^'
        let g:gitgutter_sign_modified_removed = '<'

" } // End of key bindings

" Users Functions {
    " Toggle numbers
    function! Togglelinenumbers()
       set relativenumber!
       set number!
    endfunction

    " Debug plugins on
    function! DebugOn()
      profile start profile.log
      profile func *
      profile file *
      " do some actions that your trying to debug
    endfunction

    " Debug plugins off
    function! DebugOff()
      profile pause
      noautocmd qall
      " read the output log profile.log for clues
    endfunction

" } // End of users Functions

    set undofile                    " Maintain undo history between sessions
    set undodir=~/.vim/undodir      " used to store undo history files
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
"   set list                        " set nolist hide/show hidden chars eg
"   set ff=unix or ff=dos           " change the file line endings
    if v:version > 703
        set relativenumber          " Sets the linenumbers to be relative to the current line
        colorscheme jellybeans
"        colorscheme xoria256
    else
        colorscheme xoria256
"        colorscheme solarized
    endif

    " Change Diff highlight colours
    " DiffAdd     diff mode: Added line
    " DiffChange  diff mode: Changed line
    " DiffDelete  diff mode: Deleted line
    " DiffText    diff mode: Changed text within a changed line
    hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
    hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
    hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
    hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2

    set nospell                     " Turn Spell checking off
    set background=dark             " light on dark
    highlight LineNr ctermfg=green  " Change line number color to green

" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of 2 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every four columns
    set softtabstop=2               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current

    " if &diff                      " Turn syntax highlighting off in diff mode
    "  syntax off
    " endif
 
" Run cookstyle using make

    set makeprg="cookstyle -a"

" Key Mappings

    " Ctrl W |   # Expands the current pane to full size
    " Ctrl W =   # resets the window panes 

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    let mapleader='\'
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Jumping between windows replacement for Ctrl-w[hjkl]
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    " Jump list driven with <ctrl-o> ( back ) and <ctrl-i> ( forward )
    " map <leader>j :ju <cr>

    " toggle relativenumber and numbers
    map <leader>nn  :call Togglelinenumbers()<cr>

    " tab shortcuts
    map <leader>tp  :tabprevious<cr>
    map <leader>tn  :tabNext<cr>
    map <leader>tN  :tabnew<cr>
    map <leader>tc  :tabclose<cr>

    " vimdiff
    map <leader>dg :diffget
    map <leader>mt :git mergetool --tool diffconflicts

    " Saved Macros
    let @d='ysiw"'
    let @s="ysiw'"

    " tunrn off highlighted search
    map <leader>z  :nohlsearch<cr>

    " turn on debug mode
    map <leader>DO :call DebugOn()<cr>
    map <leader>Do :call DebugOff()<cr>

    " Remove trailing white space from xml files
    autocmd BufWritePre *.xml %s/\s\+$//e

    " Format json files with tabbing = 2
    map <leader>fj :%!/bin/env python -m json.tool --indent=2<cr>
    map <leader>fx :%!xmllint --encode UTF-8 --format %<cr>

    " gitgutter block jump mappings
    nmap <leader>jn <Plug>(GitGutterNextHunk)  " git next
    nmap <leader>jp <Plug>(GitGutterPrevHunk)  " git previous
