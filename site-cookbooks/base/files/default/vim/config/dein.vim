if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
" if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or removepo your plugins here:
  call dein#add('airblade/vim-gitgutter')
  call dein#add('christoomey/vim-tmux-runner')
  call dein#add('dracula/vim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('fatih/vim-go')
  call dein#add('gabebw/vim-spec-runner')
  call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('mileszs/ack.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('rorymckinley/vim-symbols-strings')
  call dein#add('scrooloose/nerdtree')
  call dein#add('sjl/vitality.vim')
  call dein#add('skwp/greplace.vim')
  call dein#add('slim-template/vim-slim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-airline/vim-airline')
  call dein#add('w0rp/ale')
  call dein#add('wesQ3/vim-windowswap')
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('yaymukund/vim-rabl')

  " Required:
  call dein#end()
  call dein#save_state()
" endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Clean removed plugins
call map(dein#check_clean(), "delete(v:val, 'rf')")
