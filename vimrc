" Comments in Vimscript start with a `"`.
" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible
	
" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" highlight the searched words.
set hlsearch
" Enable searching as you type, rather than waiting till you press enter.
set incsearch
" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
"set mouse+=a 
" I need to use the paste, so here is the mode.
set mouse-=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
" inoremap <Left>  <ESC>:echoe "Use h"<CR>
" inoremap <Right> <ESC>:echoe "Use l"<CR>
" inoremap <Up>    <ESC>:echoe "Use k"<CR>
" inoremap <Down>  <ESC>:echoe "Use j"<CR>

" learn to use it!
inoremap jh <ESC>
" regulate the indent under normal mode
nnoremap > >>
nnoremap < <<

noremap H ^
noremap L $
noremap J G
noremap K gg

" test the function of moving under insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" colorscheme torte
" colorscheme slate
colorscheme nord

set tabstop=2
set shiftwidth=4
set autoindent
set scrolloff=999

" Because we use lightline.vim, -- INSERT -- is unnecessary anymore
" But with laststatus=2, we still can alert the error 
set noshowmode

" nord vim statusline colorscheme!
let g:lightline = {
      \ 'colorscheme': 'nord',
	    \ }


" Support WSLYank
" Vim --> Windows: Under the Visual Mode and yank(y) the content, and you can paste in Windows 
" Windows --> Vim: Copy the content and right-click the mouse to paste in Vim
if system('uname -r') =~ "microsoft"
	augroup Yank
	autocmd!
	autocmd! TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
	augroup END
endif



" Map the <Space> as Leader Key
nnoremap <SPACE> <Nop>
let mapleader = " " 

" quote the word"
nnoremap <leader>" viw<ESC>bi"<ESC>ea"<ESC>

" add a comma in the end
noremap <leader>, <ESC>$a,<ESC>

" open nerdtree plugin" 
nnoremap <leader>t :NERDTree<CR>
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25
let g:NERDTreeStatusline = "%{exists('b:NERDTreeRoot')?b:NERDTreeRoot.path._strForUI():''}"

" Set cursor shape and color in Windows Terminal
if &term =~ "xterm"
		let &t_SI = "\<Esc>[6 q"
		let &t_SR = "\<Esc>[3 q"
		let &t_EI = "\<Esc>[1 q"
endif

if exists('$TMUX')
		let &t_SI .= "\e[6 q"
    let &t_SR .= "\e[3 q"
		let &t_EI .= "\e[1 q"
endif

nmap <leader>w :w!<CR> :echoe "Saved!"<CR>

