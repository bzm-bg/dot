if has('vim_starting')
	set nocompatible

	" Required
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set number
set ruler
set noswapfile
set nowritebackup
set backspace=indent,eol,start
set showmatch
set scrolloff=5
set mouse=a
set fileencoding=utf-8
set cursorline
set whichwrap=b,s,h,l,<,>,[,]

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

inoremap <silent> jj <Esc>

colorscheme molokai
syntax on
	
" Required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplete'
if neobundle#is_installed('neocomplete')
	" neocomplete設定
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'
endif

" TABで補完できるようにする
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" Control-eでポップアップキャンセル
inoremap <expr><C-e> pumvisible() ? g:neocomplete#cancel_popup() : "\<C-e>"

NeoBundle 'kana/vim-filetype-haskell'

call neobundle#end()

" Required
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

