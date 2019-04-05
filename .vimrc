" This is stolen from the example vimrc and uses some other things i found
" online. I need to go through it to clean things up and make them more suited
" to my taste.
" 

" These settings come from the vimrc shipped with vim
" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" This comes from Max Cantor's HOW TO DO WHAT 90% OF WHAT PLUGINS DO
" FINDING FILES:
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - i.e. :find *myfile

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=4  " open in prior window
" let g:netrw_altv=1          " open splits to the right
" let g:netrw_liststyle=3     " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
" - note that :b1 and/or :b2 will generally hold the netrw buffer



" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)

" nunzio note: also don't forget vim abbreviations

" from Mastering the Vim Language youtube video
" instead of showing normal line numbers, show how many lines
" away from the cursor you are for easier j or k movement
set relativenumber " show relative line number 
set number " show current actual line number

set noswapfile

" Set the working directory to wherever the open file lives
set autochdir

" typing gb will provide a menu of buffers to select
nnoremap gb :ls<CR>:b<Space>

" make wildmenu better
set wildignorecase
set wildmode=longest,full
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

set relativenumber
set number

nnoremap <C-b> :bprevious<CR>
nnoremap ; :
imap kj <Esc>`^
imap lkj <Esc>`^:w<CR>
colorscheme desert
nnoremap <CR> :noh<CR><CR>:<backspace>
