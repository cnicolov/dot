let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/christian/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/christian/.dein')
  call dein#begin('/Users/christian/.dein')

  call dein#add('/Users/christian/.dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add("Shougo/vimproc.vim", {'build': 'make'})
  call dein#add("majutsushi/tagbar")
  call dein#add("tpope/vim-fugitive")
  call dein#add("tpope/vim-surround")
  call dein#add("tpope/vim-repeat")
  call dein#add("airblade/vim-gitgutter")
  call dein#add('zchee/deoplete-jedi')
  call dein#add('davidhalter/jedi-vim')
  call dein#add("hashivim/vim-terraform")
  call dein#add("neomake/neomake")
  call dein#add("t9md/vim-choosewin")
  call dein#add("google/vim-jsonnet")
  call dein#add("tomasiser/vim-code-dark")
  call dein#add("vim-airline/vim-airline")
  call dein#add("b4b4r07/vim-hcl")
  call dein#add("chase/vim-ansible-yaml")
  call dein#add("tpope/vim-commentary.git")
  call dein#add("fatih/vim-go", {"hook_post_update": "GoInstallBinaries"})
  call dein#add("rhysd/vim-clang-format")
  call dein#add('cnicolov/vim-licenses')
  call dein#add('artur-shaik/vim-javacomplete2')
  call dein#add('rizzatti/dash.vim')

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let dein_path = "$HOME/.dein"
let dein_plugin_path = dein_path . '/repos/github.com/Shougo/dein.vim'
let &rtp .= ','.expand(dein_plugin_path)
if dein#load_state(dein_path)
  call dein#begin(dein_path)
  call dein#add(dein_plugin_path)
  call dein#add("Shougo/deoplete.nvim")
  call dein#end()
  call dein#save_state()
endif
call denite#custom#option('default', 'statusline', 0)
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

filetype plugin indent on
syntax enable

set nu
set backspace=indent,eol,start
set incsearch
set splitright
set splitbelow
set hidden
set noswapfile
set smartcase
set autowrite
set fileformats=unix,dos,mac
set lazyredraw
set wildmenu
set wildmode=list:longest,full
set noshowmode
set timeout timeoutlen=3000 ttimeoutlen=100
set updatetime=1000
set inccommand=nosplit
set noshowcmd
set shortmess=aTIcF
set conceallevel=2 concealcursor=niv
set completeopt=longest,menuone,preview
set laststatus=2
set showtabline=2
set guioptions-=e

let s:num = 0
for s:color in [
      \ '#6c6c6c', '#ff6666', '#66ff66', '#ffd30a',
      \ '#1e95fd', '#ff13ff', '#1bc8c8', '#c0c0c0',
      \ '#383838', '#ff4444', '#44ff44', '#ffb30a',
      \ '#6699ff', '#f820ff', '#4ae2e2', '#ffffff',
      \ ]
  let g:terminal_color_{s:num} = s:color
  let s:num += 1
endfor
unlet! s:num
unlet! s:color
set termguicolors
set background=dark
set t_Co=256
set t_ut=
colorscheme codedark

let mapleader = ","
tnoremap <ESC><ESC> <C-\><c-n>
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>ca :ccl<CR>
nnoremap <leader>la :lclose<CR>
nnoremap <leader>ll :lnext<CR>
nnoremap <leader>lp :lprevious<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>a :cclose<CR>
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
nnoremap n nzzzv
nnoremap N Nzzzv
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
noremap <C-U> <C-G>u<C-U>
vnoremap > >gv
vnoremap < <gv

nmap  -  <Plug>(choosewin)
nmap  <C-p> :Denite file_rec<CR>

map <C-f> :echo expand("%:p")<cr>
map q: :q

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

command! -nargs=* -complete=help Help vertical belowright help <args>

augroup Jenkins
  autocmd BufReadPost Jenkinsfile set syntax=groovy
  autocmd BufNewFile,BufRead *.groovy,Jenkinsfile setlocal
        \ expandtab
        \ softtabstop=2
        \ tabstop=2
        \ shiftwidth=2
        \ syntax=groovy
augroup END

autocmd User Flags call Hoist("buffer", "fugitive#statusline")
autocmd FileType go nmap <leader>r <Plug>(go-run-tab)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType make setlocal noexpandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType go setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType terraform setlocal tabstop=2 softtabstop=2 shiftwidth=2 et
autocmd BufRead,BufNewFile *.gradle set filetype=gradle
autocmd BufRead,BufNewFile *.slide set filetype=slide
augroup mymkdir
  autocmd mymkdir InsertLeave * if &paste | setlocal nopaste | echo 'nopaste' | endif | if &l:diff | diffupdate | endif
  autocmd mymkdir InsertLeave * if &l:diff | diffupdate | endif
  autocmd mymkdir BufWritePre * call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
augroup END

function! s:mkdir_as_necessary(dir, force) abort
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction


let g:tagbar_type_ansible = {
    \ 'ctagstype' : 'ansible',
    \ 'kinds' : [
        \ 't:tasks',
        \ 'i:include'
    \ ],
    \ 'sort' : 0
\ }

let g:tagbar_type_gradle = {
      \ 'ctagstype' : 'Gradle',
      \ 'kinds'     : [
        \ 't:tasks',
        \ 'm:methods'
      \ ],
      \ 'deffile'   : expand('<sfile>:p:h:h') . '/ctags/gradle.ctags'
      \ }

let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'Groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:classes',
        \ 'i:interfaces',
        \ 't:traits',
        \ 'e:enums',
        \ 'r:constructors',
        \ 'm:methods',
        \ 'f:fields:1'
    \ ],
    \ 'deffile'   : expand('<sfile>:p:h:h') . '/ctags/groovy.ctags'
\ }

let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:proto_fmt_on_save = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '/Users/knikolov/.cache/deoplete/go/darwin_amd64'
let g:deoplete#sources#go#pointer = 1
let g:go_fmt_autosave = 1
let g:go_metalinter_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_term_enabled = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1


function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#set('buffer',        'mark', 'ℬ')
call deoplete#custom#set('tag',           'mark', '⌦')
call deoplete#custom#set('omni',          'mark', '⌾')
call deoplete#custom#set('ternjs',        'mark', '⌁')
call deoplete#custom#set('jedi',          'mark', '⌁')
call deoplete#custom#set('vim',           'mark', '⌁')
call deoplete#custom#set('neosnippet',    'mark', '⌘')
call deoplete#custom#set('syntax',        'mark', '♯')
call deoplete#custom#set('tmux-complete', 'mark', '⊶')
call deoplete#custom#set('vim',           'rank', 630)
call deoplete#custom#set('ternjs',        'rank', 620)
call deoplete#custom#set('jedi',          'rank', 610)
call deoplete#custom#set('omni',          'rank', 600)
call deoplete#custom#set('neosnippet',    'rank', 510)
call deoplete#custom#set('member',        'rank', 500)
call deoplete#custom#set('file_include',  'rank', 420)
call deoplete#custom#set('file',          'rank', 410)
call deoplete#custom#set('tag',           'rank', 400)
call deoplete#custom#set('around',        'rank', 330)
call deoplete#custom#set('buffer',        'rank', 320)
call deoplete#custom#set('dictionary',    'rank', 310)
call deoplete#custom#set('tmux-complete', 'rank', 300)
call deoplete#custom#set('syntax',        'rank', 200)
call deoplete#custom#set('_', 'converters', [
  \ 'converter_remove_paren',
  \ 'converter_remove_overlap',
  \ 'converter_truncate_abbr',
  \ 'converter_truncate_menu',
  \ 'converter_auto_delimiter',
  \ ])

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#denite#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

autocmd BufEnter * silent! lcd %:p:h

imap jj <ESC>

let g:licenses_custom_path = '$HOME/.config/nvim/licenses/'

command! License call InsertLicense('kinvey')
let g:ref_javadoc_path = 'build/docs'

let g:jedi#force_py_version = 3
