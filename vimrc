
" Setup Bundle Support {
	" The next two lines ensure that the ~/.vim/bundle/ system works
		runtime! autoload/pathogen.vim
		silent! call pathogen#runtime_append_all_bundles()
	" }

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif	


" Vim UI {




" }

" General {
	syntax on 														" syntax highlighting
	set mouse=a														" automatically enable mouse usage
	scriptencoding utf-8
	set shortmess+=filmnrxoOtT										" abbrev. of messages (avoids 'hit enter')
	set virtualedit=onemore 										" allow for cursor beyond last character
	set history=1000												" Store a ton of history (default is 20)
	
	" Setting up the directories {
		set backup 													" backups are nice ...
		set backupdir=$HOME/.vimbackup//							" but not when they clog .
		set directory=$HOME/.vimswap//							 	" Same for swap files
		set viewdir=$HOME/.vimviews//								" same for view files
		
		"" Creating directories if they don't exist
		silent execute '!mkdir -p $HOME/.vimbackup'
		silent execute '!mkdir -p $HOME/.vimswap'
		silent execute '!mkdir -p $HOME/.vimviews'
		au BufWinLeave * silent! mkview								"make vim save view (state) (folds, cursor, etc)
		au BufWinEnter * silent! loadview							"make vim load view (state) (folds, cursor, etc)
	" }
" }


" Vim UI {
	set showmode                   	" display the current mode

	set cul							" highlight current line

	if has('cmdline_info')
		set ruler                  	" show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
	endif

	if has('statusline')
		set laststatus=1           	" show statusline only if there are > 1 windows
		" Use the commented line if fugitive isn't installed
		"set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
		set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
	endif

	set list						" See hidden chars
	set backspace=indent,eol,start 	" backspace for dummys
	set linespace=0 				" No extra spaces between rows
	set nu							" Line numbers on
	set showmatch                  	" show matching brackets/parenthesis
	set incsearch 					" find as you type search
	set hlsearch 					" highlight search terms
	set winminheight=0 				" windows can be 0 line high 
	set ignorecase 					" case insensitive search
	set smartcase 					" case sensitive when uc present
	set wildmenu 					" show list instead of just completing
	set wildmode=list:longest,full 	" comand <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	set scrolljump=5 				" lines to scroll when cursor leaves screen
	set scrolloff=3 				" minimum lines to keep above and below cursor
	set foldenable  				" auto fold code
	set gdefault					" the /g flag on :s substitutions by default

" }

" Formatting {
	set nowrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=4               	" use indents of 4 spaces
	set noexpandtab 	       		" tabs are tabs, not spaces
	set tabstop=4 					" an indentation every four columns
	"set matchpairs+=<:>            	" match, to be used with % 
	set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

	" Use the same symbols as TextMate for tabstops and EOLs
		set listchars=tab:▸\ ,eol:¬
" }

" Key Mappings {
	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

	" For when you forget to sudo.. Really Write the file.
	cmap w!! w !sudo tee % >/dev/null

	let mapleader =","
	nmap <leader>v :tabedit $MYVIMRC<CR>
	
	" Set easier navigation on tabs
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
		map <leader>w :tabclose<CR>
	
	" Set easier navigation on windows
		map <C-h> <C-w>h
		map <C-j> <C-w>j
		map <C-k> <C-w>k
		map <C-l> <C-w>l
	
	
	" Can't remember what this is...
		:filetype plugin on
		set nocompatible
		filetype on
		filetype plugin on
	
	
	
	" Show syntax highlighting groups for word under cursor
	nmap <C-S-P> :call <SID>SynStack()<CR>
	function! <SID>SynStack()
		if exists("*synstack")
			echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
		endif
	endfunc
" }
           

colorscheme desert


" GUI Settings {
	if has("gui_running")
		" Basics {
			set columns=180 " perfect size for me
			set lines=55 " perfect size for me
			set mousehide " hide the mouse cursor when typing
			set guioptions-=T	" remove the toolbar
		" }
		
		" Font Switching Binds {
			map <F8> <ESC>:set guifont=Consolas:h8<CR>
			map <F9> <ESC>:set guifont=Consolas:h10<CR>
			map <F10> <ESC>:set guifont=Consolas:h12<CR>
			map <F11> <ESC>:set guifont=Consolas:h16<CR>
			map <F12> <ESC>:set guifont=Consolas:h20<CR>
		" }
	else
		set t_Co=256	" Default to 256 colors
	endif
" }





" Plugins {

	" snipmate {
		" make html snippets work in php (snipmate)
		au BufRead *.php set ft=php.html
		au BufNewFile *.php set ft=php.html
	" }
	
	" NERDTree
		map <leader>t :NERDTreeToggle<CR>
	" }

	" Gundo
		nnoremap <F5> :GundoToggle<CR>
	" }
" }
