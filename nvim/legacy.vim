set nocompatible
syntax on
set encoding=utf-8
set termguicolors

let mapleader = ","
set clipboard=unnamedplus

set number
set ruler
set visualbell
set wrap
set autoread
set updatetime=100
set signcolumn=yes
set shortmess+=c

set undodir=~/.cache/nvim/undodir
set undofile

set hlsearch
set incsearch

set autoindent
set smartindent
set expandtab

set completeopt=menuone,noinsert,noselect
set cino=(0,W4

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox

hi LspCxxHlGroupMemberVariable guifg=#83a598
hi Pmenu                 guibg=#282828 guifg=#ebdbb2
hi PmenuSel              guibg=#458588 guifg=#ebdbb2 gui=bold
hi PmenuSbar             guibg=#3c3836
hi PmenuThumb            guibg=#7c6f64
hi CmpItemAbbr           guifg=#ebdbb2
hi CmpItemAbbrMatch      guifg=#fabd2f gui=bold
hi CmpItemAbbrMatchFuzzy guifg=#fabd2f gui=bold
hi CmpItemKind           guifg=#83a598
hi CmpItemMenu           guifg=#928374

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 1

nmap .s <Plug>(easymotion-overwin-f)
nmap .d <Plug>(easymotion-overwin-f2)
nmap .g <Plug>(easymotion-overwin-w)
nmap .t <Plug>(easymotion-tl)
nmap .f <Plug>(easymotion-fl)
nmap .j <Plug>(easymotion-j)
nmap .k <Plug>(easymotion-k)
nmap ./ <Plug>(easymotion-overwin-line)
nmap .a <Plug>(easymotion-jumptoanywhere)

nnoremap <silent> ;w :update<CR>

nmap <C-c> <Esc>
imap <C-c> <Esc>
vmap <C-c> <Esc>
omap <C-c> <Esc>

nnoremap <C-z> <Nop>

augroup cpp_helpers
  autocmd!
  autocmd BufEnter,BufNew *.cpp nnoremap <silent> <buffer> ;p  :e %<.hpp<CR>
  autocmd BufEnter,BufNew *.hpp nnoremap <silent> <buffer> ;p  :e %<.cpp<CR>
  autocmd BufEnter,BufNew *.cpp nnoremap <silent> <buffer> ;vp :leftabove vs %<.hpp<CR>
  autocmd BufEnter,BufNew *.hpp nnoremap <silent> <buffer> ;vp :rightbelow vs %<.cpp<CR>
  autocmd BufEnter,BufNew *.cpp nnoremap <silent> <buffer> ;xp :leftabove split %<.hpp<CR>
  autocmd BufEnter,BufNew *.hpp nnoremap <silent> <buffer> ;xp :rightbelow split %<.cpp<CR>

  autocmd BufEnter,BufNew *.c   nnoremap <silent> <buffer> ;p  :e %<.h<CR>
  autocmd BufEnter,BufNew *.h   nnoremap <silent> <buffer> ;p  :e %<.c<CR>
  autocmd BufEnter,BufNew *.c   nnoremap <silent> <buffer> ;vp :leftabove vs %<.h<CR>
  autocmd BufEnter,BufNew *.h   nnoremap <silent> <buffer> ;vp :rightbelow vs %<.c<CR>
  autocmd BufEnter,BufNew *.c   nnoremap <silent> <buffer> ;xp :leftabove split %<.h<CR>
  autocmd BufEnter,BufNew *.h   nnoremap <silent> <buffer> ;xp :rightbelow split %<.c<CR>
augroup END

augroup woolly_tabs
  autocmd!
  autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp,*.txt setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent smartindent
augroup END
