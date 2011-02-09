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








" Use the same symbols as TextMate for tabstops and EOLs
	set listchars=tab:▸\ ,eol:¬

"Invisible character coloss:s
	highlight NonText guifg=#4a4a59
	highlight SpecialKey guifg=#4a4a59

colorscheme wombat
:set list
:set number

