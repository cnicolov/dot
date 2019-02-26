" Basic configuration & Plugins {{{
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

if &compatible
  set nocompatible
endif

set runtimepath+=/Users/christian/.dein/repos/github.com/Shougo/dein.vim
if dein#load_state('/Users/christian/.dein')
  call dein#begin('/Users/christian/.dein')

  call dein#add('/Users/christian/.dein/repos/github.com/Shougo/dein.vim')
  call dein#add('plasticboy/vim-markdown', {'on_ft': ['md', 'markdown']})
  " call dein#add('autozimu/LanguageClient-neovim', {
  " \ 'rev': 'next',
  " \ 'build': 'install.sh',
  " \ })
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('mbbill/undotree')
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('itkq/fluentd-vim.git')
  call dein#add('skywind3000/gutentags_plus')
  call dein#add('ozelentok/denite-gtags')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('haya14busa/incsearch-fuzzy.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('martinda/Jenkinsfile-vim-syntax')
  call dein#add('w0rp/ale')
  call dein#add('tpope/vim-endwise')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add("Shougo/vimproc.vim", {'build': 'make'})
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add("junegunn/fzf.vim", { 'depends': 'fzf' })
  call dein#add('junegunn/vim-easy-align')
  call dein#add("majutsushi/tagbar", {'on_cmd': 'TagbarToggle'})
  call dein#add("editorconfig/editorconfig-vim")
  call dein#add("tpope/vim-fugitive")
  call dein#add("tpope/vim-surround")
  call dein#add("tpope/vim-repeat")
  call dein#add("airblade/vim-gitgutter")
  call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTree'})
  call dein#add('markcornick/vim-bats', {'on_ft': 'bats'})
  call dein#add("hashivim/vim-terraform")
  call dein#add("neomake/neomake")
  call dein#add("chriskempson/base16-vim")
  call dein#add("vim-airline/vim-airline")
  call dein#add("vim-airline/vim-airline-themes")
  call dein#add("tpope/vim-commentary.git")
  call dein#add("fatih/vim-go", {"hook_post_update": "GoInstallBinaries"})
  call dein#add('cnicolov/vim-licenses')
  call dein#add('rizzatti/dash.vim')
  call dein#add('godlygeek/tabular', {'on_cmd': 'Tabularize'})
  call dein#add('vito-c/jq.vim', {'on_ft': 'jq'})
  call dein#add('NLKNguyen/papercolor-theme')
  call dein#add('aklt/plantuml-syntax')
  call dein#add('scrooloose/vim-slumlord')
  call dein#add('Shougo/context_filetype.vim')
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
" }}}

" Settings {{{
set noswapfile
set nobackup
set nowb
silent !mkdir $HOME/.local/share/nvim/backups > /dev/null 2>&1
set undodir=$HOME/.local/share/nvim/backups
set undofile
set hidden

set modelines=2
set signcolumn=yes
set visualbell    " don't beep
set noerrorbells  " don't beep
set autoread
set nu
set backspace=indent,eol,start
set history=1000
set incsearch
set splitright
set splitbelow
set hidden
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set smartcase
set encoding=utf-8
set ttimeoutlen=50
set fileformats=unix,dos,mac
set lazyredraw
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/vendor/*,*/.build/*
set wildmenu
set wildmode=list:longest,full
set noshowmode
set timeout timeoutlen=3000 ttimeoutlen=100
set updatetime=100
set inccommand=nosplit
set noshowcmd
set shortmess=aTIcF
set conceallevel=2 concealcursor=niv
set termguicolors
set listchars+=conceal:Δ
set completeopt=longest,menuone,preview
" set completeopt=menu,menuone,preview,noselect,noinsert
set laststatus=2
set showtabline=2
set guioptions-=e
set cursorline
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if $TERM_PROGRAM == 'iTerm.app'
  " different cursors for insert vs normal mode
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\x1b[\x34 q"
    let &t_EI = "\x1b[\x32 q"
  endif
endif
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
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
set t_Co=256
set t_ut=
let base16colorspace=256
set background=dark
colorscheme PaperColor
set mouse=a
set tags=tags;/
" }}}
" Autogroups {{{
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us textwidth=80
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us textwidth=80
autocmd FileType gitcommit setlocal spell spelllang=en_us textwidth=80

augroup Jenkins
  autocmd BufNewFile,BufRead Jenkinsfile setlocal
        \ expandtab
        \ softtabstop=2
        \ tabstop=2
        \ shiftwidth=2
augroup END
autocmd FileType go nmap <leader>r <Plug>(go-run-tab)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType make setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType terraform setlocal tabstop=2 softtabstop=2 shiftwidth=2 et
autocmd FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 et
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
" }}}
" Plugin configuration {{{
let g:neosnippet#snippets_directory = expand('~').'/dotfiles/snippets'
call denite#custom#option('default', 'statusline', 0)
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
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

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

let g:deoplete#enable_at_startup = 1
let g:proto_fmt_on_save = 1
let g:AutoPairsMapCR=0
set completeopt+=noinsert
set completeopt+=noselect
let g:go_snippet_engine = "neosnippet"
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#gocode_binary = expand('~/go/bin/gocode')
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#builtin_objects = 1
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_modules = ['ctags']
" config project root markers.
let g:gutentags_project_root = ['.git']
let g:gutentags_auto_add_gtags_cscope = 1
let gutentags_plus_switch = 1


let g:go_autodetect_gopath = 1
let g:go_gocode_socket_type = 'unix'
let g:go_template_use_pkg = 1
let g:go_decls_includes = 'func,type'
let g:go_highlight_variable_assignments = 1
let g:go_autodetect_gopath = 1
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1
let g:go_metalinter_autosave = 0
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
let g:go_highlight_extra_types = 1
" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_list_type = "quickfix"
let g:go_test_show_name = 1



function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.go = ['omni']

call deoplete#custom#option('neosnippet', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#option('buffer',        'mark', 'ℬ')
call deoplete#custom#option('tag',           'mark', '⌦')
call deoplete#custom#option('omni',          'mark', '⌾')
call deoplete#custom#option('ternjs',        'mark', '⌁')
call deoplete#custom#option('jedi',          'mark', '⌁')
call deoplete#custom#option('vim',           'mark', '⌁')
call deoplete#custom#option('neosnippet',    'mark', '⌘')
call deoplete#custom#option('syntax',        'mark', '♯')
call deoplete#custom#option('tmux-complete', 'mark', '⊶')
call deoplete#custom#option('vim',           'rank', 630)
call deoplete#custom#option('ternjs',        'rank', 620)
call deoplete#custom#option('jedi',          'rank', 610)
call deoplete#custom#option('omni',          'rank', 600)
call deoplete#custom#option('neosnippet',    'rank', 510)
call deoplete#custom#option('member',        'rank', 500)
call deoplete#custom#option('file_include',  'rank', 420)
call deoplete#custom#option('file',          'rank', 410)
call deoplete#custom#option('tag',           'rank', 400)
call deoplete#custom#option('around',        'rank', 330)
call deoplete#custom#option('buffer',        'rank', 320)
call deoplete#custom#option('dictionary',    'rank', 310)
call deoplete#custom#option('tmux-complete', 'rank', 300)
call deoplete#custom#option('syntax',        'rank', 200)
call deoplete#custom#option('_', 'converters', [
  \ 'converter_remove_paren',
  \ 'converter_remove_overlap',
  \ 'converter_truncate_abbr',
  \ 'converter_truncate_menu',
  \ 'converter_auto_delimiter',
  \ ])

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#denite#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '¦'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline_extensions = ['branch', 'tabline', 'hunks', 'fugitiveline', 'whitespace']
let g:airline#extensions#whitespace#checks = [
    \ 'indent',
    \'trailing',
    \ 'long',
    \ 'mixed-indent-file'
    \ ]
let g:airline_extensions#tabline#show_buffers = 1
let airline#extensions#tabline#ignore_bufadd_pat =
            \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
let g:airline_highlighting_cache = 1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ 't'  : 'T',
    \ }
let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 '
      \}

let g:licenses_custom_path = '$HOME/.config/nvim/licenses/'
command! License call InsertLicense('kinvey')
let g:quickfixsigns_protect_sign_rx = '^neomake_'

let g:neotags#sh#order = 'fa'

call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:quickfixsigns_protect_sign_rx = '^neomake_'
let g:neomake_shellcheck_maker = {
  \ 'args' : ['-fgcc', '-x'],
  \ 'cwd': '$PWD',
  \ 'errorformat':
  \ '%f:%l:%c: %trror: %m [SC%n],'.
  \ '%f:%l:%c: %tarning: %m [SC%n],'.
  \ '%I%f:%l:%c: Note: %m [SC%n]',
  \ 'output_stream': 'stdout',
  \ 'short_name': 'SC',
  \ }

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_auto_insert_bullets = 1

let g:airline#extensions#tabline#keymap_ignored_filetypes = [
  \ 'vimfiler',
  \ 'nerdtree',
  \ ]
let airline#extensions#tabline#current_first = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_spell=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#keymap#enabled = 1
let g:airline_exclude_preview = 1

let g:terraform_align = 1
let g:terraform_fmt_on_save = 0
let g:terraform_fold_sections = 1
let g:terraform_remap_spacebar = 1
" let g:terraform_comment_string = '# '

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 0
let g:ale_change_sign_column_color = 0
let g:ale_sh_shellcheck_options = '-x'
let g:sh_language_server_use_global = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_use_global_executables = 1
let g:ale_sh_shell_default_shell = 'bash'
let g:ale_sh_shfmt_options = '-i 2 -ci'
let g:ale_linters = {
    \ 'sh': ['shellcheck', ],
    \ }
let g:ale_fixers = {
  \ 'sh': ['shfmt', 'remove_trailing_lines', 'trim_whitespace'],
  \ 'Jenkinsfile': ['trim_whitespace', 'remove_trailing_lines'],
  \ }

augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" set completefunc=LanguageClient#complete
" set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
" }}}
" Plugin settings {{{
let g:tagbar_type_terraform = {
  \ 'ctagstype' : 'terraform',
  \ 'sro'       : '.',
  \ 'kinds'     : [
    \ 'p:Providers',
    \ 'v:Variables',
    \ 'm:Modules',
    \ 'f:TFVars',
    \ 'd:Data Sources',
    \ 'r:Resources',
  \ ],
  \ 'deffile'   : expand('$HOME') . '/.ctags'
\ }
" }}}
" Mappings {{{
let mapleader = ","
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

let g:incsearch#auto_nohlsearch = 1

nmap <PageDown> <C-d>
nmap <PageUp> <C-u>
"""" Jump to previous / next cursor position
nnoremap <A-Left> <C-o>
nnoremap <A-Right> <C-i>

nnoremap <leader>lc :License<CR>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Spell checking
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
cmap w!! w !sudo tee % >/dev/null
imap jj <ESC>
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

imap <expr><Leader>l
      \ neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"
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
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
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
nmap  <C-p> :Files<CR>
map <C-f> :echo expand("%:p")<cr>
map q: :q

let g:vim_markdown_fenced_languages = ['terraform=terraform']

nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <Leader>rr <C-|>

augroup reload-files-changed-outside
  autocmd!
  autocmd BufEnter,FocusGained * checktime
augroup END
" fold functions in shell files
let g:sh_fold_enabled = 1
" markdown folding
let g:markdown_folding = 1

let g:plantuml_executable_script = '/Users/christian/.local/bin/plantuml'

let g:slumlord_plantuml_jar_path = '/Users/christian/.local/lib/plantuml.jar'

let g:slumlord_separate_win = 1
" screen / tmux title
if len($TMUX) > 0 || len($STY) > 0
  " set screen title to vim $PWD folder name - format 'v:folder'
  set titlestring=v:%(%{fnamemodify(expand(\"$PWD\"),\":t\")}%)
  set t_ts=k
  set t_fs=\
  set title
endif
let g:yaml_schema = 'pyaml'
" }}}
" vim:foldmethod=marker:foldlevel=0
