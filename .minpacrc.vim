command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean packadd minpac | source $MYVIMRC | call minpac#clean()

silent! packadd minpac

if !exists('loaded_minpac')
  finish
endif

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-projectionist')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-dispatch')
call minpac#add('skywind3000/asyncrun.vim')

call minpac#add('dense-analysis/ale')   " async syntax checking
call minpac#add('ycm-core/YouCompleteMe')

call minpac#add('tpope/vim-endwise')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('jiangmiao/auto-pairs')

call minpac#add('vim-airline/vim-airline')
call minpac#add('janko-m/vim-test')

call minpac#add('dag/vim-fish')
call minpac#add('othree/html5.vim')
call minpac#add('JulesWang/css.vim')
call minpac#add('elzr/vim-json')
call minpac#add('othree/yajs.vim')
call minpac#add('othree/es.next.syntax.vim')
" call minpac#add('mxw/vim-jsx')
call minpac#add('MaxMEllon/vim-jsx-pretty')
call minpac#add('mustache/vim-mustache-handlebars')
call minpac#add('hashivim/vim-terraform')

call minpac#add('Valloric/MatchTagAlways')
call minpac#add('powerman/vim-plugin-AnsiEsc')
