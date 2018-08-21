set shell=/bin/bash

set clipboard=unnamed

syntax on
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
au FocusLost * :set norelativenumber
au FocusGained * :set relativenumber

let g:dracula_colorterm = 0
color dracula

if $TERM == "xterm-256color"
  set t_Co=256
end

set list
set list listchars=tab:»·,trail:·,nbsp:·

set tabstop=2
set shiftwidth=2
set expandtab

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq

set hlsearch incsearch

let mapleader=","

" Use ack instead of grep
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

" Open new split panes to right and bottom
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <space> zz

nnoremap <leader>n :NERDTree<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

let g:ale_lint_delay = 500
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '..'

fun! <SID>StripTrailingWhitespaces()
  if exists('b:noStripWhitespace')
    return
  endif
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre *.conf.erb let b:noStripWhitespace=1
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

let g:ctrlp_open_new_file = 'h'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(\.git|\.hg|\.svn|\.chef\/local-mode-cache|node_modules|log|rcov|tmp)$',
  \ 'file': '\v\.(swp|gif|jpg|png|pdf|rar|tar\.gz|zip)$'
  \ }

set modifiable

let g:gitgutter_realtime = 0
set updatetime=750

let g:ackhighlight = 1
let g:ackpreview = 1

" Save files with sudo
cmap w!! w !sudo tee > /dev/null %

" Allow files to be modified when hidden
set hidden

" Vim tmux runner
let g:VtrUseVtrMaps = 1

" Vim spec runner
let g:spec_runner_dispatcher = 'VtrSendCommand! {command}'
map <Leader>tf <Plug>RunCurrentSpecFile
map <Leader>tt <Plug>RunFocusedSpec
map <Leader>tl <Plug>RunMostRecentSpec

au BufRead,BufNewFile Berksfile,Capfile,Guardfile,UserGemfile set filetype=ruby
au BufRead,BufNewFile Procfile,Procfile.dev set filetype=yaml
au BufNewFile,BufRead *.srt setf srt
