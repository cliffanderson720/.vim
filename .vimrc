" Vundle plugin nonsense
set nocompatible
filetype off

set rtp+=${HOME}/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'godlygeek/tabular'
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'mileszs/ack.vim'


call vundle#end()
filetype plugin indent on

set hlsearch
set relativenumber
set number
set nowrap
set ignorecase
set smartcase
set formatprg=par\ -w65q
set grepprg=grep\ -rnE
set list
set listchars=tab:>-
"set formatoptions+=a
"set switchbuf=uselast " Make quickfix use last window if the buffer isn't already open somewhere

" How to put vim swp files in a controlled place
" https://stackoverflow.com/questions/821902/disabling-swap-files-creation-in-vim
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile " Make an undo file for persistent undos

" Set different colors for insert and normal modes
" https://stackoverflow.com/questions/48271865/vim-whats-the-best-way-to-set-statusline-color-to-change-based-on-mode

"hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
"hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

hi NormalColor guifg=Black guibg=Green ctermbg=46 ctermfg=0
hi InsertColor guifg=Black guibg=Cyan ctermbg=51 ctermfg=0
hi ReplaceColor guifg=Black guibg=maroon1 ctermbg=165 ctermfg=0
hi VisualColor guifg=Black guibg=Orange ctermbg=202 ctermfg=0

"hi ColorColumn ctermbg=DarkGrey ctermbg=DarkGrey
"https://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
"match ErrorMsg '\%>80v.\+'
"OR
highlight OverLength ctermbg=blue ctermfg=white guibg=#592929
match OverLength /\%81v./


"set statusline=
"set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
"set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
"set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
"set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}

"vim Fugitive configs
"set statusline+=%{fugitive#statusline()}
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Sources from "TheFrugalComputerGuy" on YouTube "Vim (34) Netrw fix fuzzy find"
" netrw configurations
let g:netrw_preview=1
let g:netrw_altv=1

"let g:netrw_liststyle=3 " shows listing as a tree
" Set the split windows to always be equal and open splits to the right
let g:netrw_winsize=0 " Set default windows size to always be equal
let g:netrw_preview=1 " Open splits to the right

" Lines for fuzzy searching
set nocompatible " limit search to your project
set path+=** " Search all subdirectories and recursively
set wildmenu " shows multiple matches on one line
" nnoremap <expr> * ':%s/'.expand('<cword>').'//gn<CR>``' "This can keep the cursor from moving when I highlihght a word

" Have vim look interpret filesnames as IMM files if no other file is found
set includeexpr=v:fname.'.imm'

" Diff color schemes
if &diff
	"colorscheme github
	colorscheme molokai
endif

" Add YAML syntax formatting
au BufNewFile,BufRead *yaml,*yml so ~/.vim/syntax/YAML.vim

" Alternate Key bindings
" Escape characters
inoremap jk <Esc> 
inoremap kj <Esc>
" Add date stamp with F5
inoremap <F5> <C-R>=strftime('%m%d%Y')<CR>
nnoremap <F5> "=strftime('%m%d%Y')<CR>P

" Count ocurrences of word
" https://vim.fandom.com/wiki/Count_number_of_matches_of_a_pattern
map ,* *<C-O>:%s///gn<CR>

"autocmd BufWritePre * %s/\s\+$//e

