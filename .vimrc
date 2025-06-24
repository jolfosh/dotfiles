set nocompatible
set timeout timeoutlen=500 ttimeoutlen=100
set clipboard=unnamed,unnamedplus
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set number
set smartcase
set nowrap
set hlsearch
set splitbelow
set splitright
let mapleader = ' '

inoremap jk <Esc>

" Set Absolute & Relative line numbers
nnoremap <leader>na :set rnu!<CR>

" Clear search highlights
nnoremap <Esc> :nohl<CR>

" Set Save & Quit
nnoremap <leader>w :w<cr>
vnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
vnoremap <leader>q :q<cr>

" Commenting blocks of code.
" augroup commenting_blocks_of_code
"   autocmd!
"   autocmd FileType c,cpp,cs,js,java,scala 	let b:comment_leader = '// '
"   autocmd FileType cshtml,razor			let b:comment_leader = '@// '	
"   autocmd FileType sh,ruby,python   		let b:comment_leader = '# '
"   autocmd FileType conf,fstab       		let b:comment_leader = '# '
"   autocmd FileType tex              		let b:comment_leader = '% '
"   autocmd FileType mail             		let b:comment_leader = '> '
"   autocmd FileType vim              		let b:comment_leader = '" '
" augroup END
" noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

if !has('nvim')
" VsVim Specific
  nnoremap <leader>ki :vsc Edit.QuickInfo<CR>
  nnoremap <leader>kp :vsc Edit.ParameterInfo<CR>
  nnoremap gcc :vsc Edit.ToggleLineComment<CR>
	vnoremap gcc :vsc Edit.CommentSelection<CR>
	vnoremap gcu :vsc Edit.UncommentSelection<CR>
  nnoremap <leader>] :vsc Edit.NextMethod<CR>
  nnoremap <leader>[ :vsc Edit.PreviousMethod<CR>
endif
