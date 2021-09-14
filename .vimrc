if has('multi_byte')
  set encoding=utf-8
  setglobal fileencoding=utf-8
  " setglobal bomb
  set fileencodings=ucs-bomb,utf-8,latin1
endif

scriptencoding 'utf-8'

if !empty(glob('~/.minpacrc.vim'))
  source ~/.minpacrc.vim
endif

syntax on
filetype plugin indent on

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ silent! execute "normal! g`\"" |
    \ endif
endif

set mouse=a
set history=700	    " lines
set ttimeoutlen=10

set pastetoggle=<F10>

set updatetime=259

let jsx_ext_required = 0

nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)

let markdown_fenced_languages = ['javascript', 'jsx', 'bash=sh']

let mta_filetypes = {
\   'javascript.jsx': 1,
\   'html': 1,
\ }

let ale_linters = {
\   'javascript': ['eslint'],
\   'json': ['jshint'],
\   'css': ['stylelint'],
\   'vim': ['vint'],
\ }

let ale_fixers = {
\   'javascript': ['eslint'],
\ }

let ale_fix_on_save = 1

let ale_emit_conflict_warnings = 0

let AutoPairsCenterLine = 0

set wildmenu                " tab-completion
set wildmode=longest:full   " closest to fish tab-completion

set hlsearch
set incsearch         " highlight matches while searching

set lazyredraw      " don't redraw while editing macros

colorscheme delek

highlight ALEWarning ctermbg=DarkMagenta

set expandtab
set smarttab
set shiftwidth=2
" set tabstop=8		" changing this messes up printing, etc.
set softtabstop=2
" set noexpandtab	" but it looks like we are

set autoindent
set smartindent

set noshowmode      " airline already does
set laststatus=2    " always show the status bar
let airline#extensions#wordcount#enabled = 0
let airline#extensions#whitespace#mixed_indent_algo = 1

let test#strategy = 'asyncrun_background'
let test#ruby#runner = 'rspec'
let test#javascript#runner = 'jest'

" YouCompleteMe
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>typ :YcmCompleter GetType<CR>
nnoremap <leader>ref :YcmCompleter GoToReferences<CR>
nnoremap <leader>doc :YcmCompleter GetDoc<CR>
command! -nargs=1 Rename YcmCompleter RefactorRename <args>

let ycm_autoclose_preview_window_after_completion = 1
let ycm_autoclose_preview_window_after_insertion = 1
let ycm_complete_in_comments = 1
let ycm_collect_identifiers_from_comments_and_strings = 1
let ycm_seed_identifiers_with_syntax = 1
let ycm_hover = {'command': '', 'syntax': &filetype}
nmap <silent> <leader>h :call ToggleYcmHover()<CR>

let ycm_key_list_select_completion = ['<TAB>']
inoremap <silent> <Down> <C-R>=pumvisible() ? "\<lt>C-y\<lt>Down>" : \<lt>Down>"<CR>"
let ycm_key_list_previous_completion = ['<S-TAB>']
inoremap <silent> <Up> <C-R>=pumvisible() ? "\<lt>C-y\<lt>Up>" : \<lt>Up>"<CR>"

let ycm_semantic_triggers = {
\ 'js': ['.', '::'],
\ }

set conceallevel=2

" allow undo even after file is closed/opened
set undodir=~/.vim/undo
set undofile

set nostartofline     " when line-changing commands are issued

set viminfo='100,<50,s10    " do not disable highlighting when opening the viminfo file

" turn off backups since most important data will be saved to git
set nowritebackup
set nobackup    " when reading
" set swapfile

" faster saving
map <C-c> :quit<CR>
map <C-x> :exit<CR>

function ToggleYcmHover()
  if b:ycm_hover.command != ''
    let b:ycm_hover.command = ''
    return
  endif

  let b:ycm_hover.command = 'GetDoc'
  execute "normal \<plug>(YCMHover)"
endfunction
