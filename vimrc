call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif	

let mapleader =","
nmap <leader>v :tabedit $MYVIMRC<CR>

"Linux and windows users (using the control key)
	map gl gt
	map gh gT
	map <leader>1 1gt
	map <leader>2 2gt
	map <leader>3 3gt
	map <leader>4 4gt
	map <leader>5 5gt
	map <leader>6 6gt
	map <leader>7 7gt
	map <leader>8 8gt
	map <leader>9 9gt
	map <leader>0 :tablast<CR>
	map <leader>n :tabnew<CR>
	map <leader>t :NERDTreeToggle<CR>
	map <leader>w :tabclose<CR>

	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

	:filetype plugin on
	set nocompatible
	filetype on
	filetype plugin on

au BufRead *.php set ft=php.html
au BufNewFile *.php set ft=php.html



" Use the same symbols as TextMate for tabstops and EOLs
	set listchars=tab:▸\ ,eol:¬


" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if exists("*synstack")
		echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
	endif
endfunc
           

colorscheme desert
:set list
:set number


" set tabs length
:set tabstop=4
:set shiftwidth=4

" GUI Settings {
if has("gui_running")
	" Basics {
		set columns=180 " perfect size for me
		set guioptions=ce 
		"              ||
		"              |+-- use simple dialogs rather than pop-ups
		"              +  use GUI tabs, not console style tabs
		set lines=55 " perfect size for me
		set mousehide " hide the mouse cursor when typing
	" }
	
	" Font Switching Binds {
		map <F8> <ESC>:set guifont=Consolas:h8<CR>
		map <F9> <ESC>:set guifont=Consolas:h10<CR>
		map <F10> <ESC>:set guifont=Consolas:h12<CR>
		map <F11> <ESC>:set guifont=Consolas:h16<CR>
		map <F12> <ESC>:set guifont=Consolas:h20<CR>
	" }
else
	set t_Co=256
endif
" }


"buffer
set hidden
