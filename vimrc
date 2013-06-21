" Base on Gary Bernhardt's .vimrc file
" Use CtrlP instead of CommandT

set nocompatible | filetype indent plugin on | syn on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP Addons BY VAM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun SetupVAM()
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  exec 'set rtp+='.vam_install_path.'/vim-addon-manager'
  " let g:vim_addon_manager = { your config here see "commented version" example and help
  if !isdirectory(vam_install_path.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(vam_install_path, 1).'/vim-addon-manager'
  endif
  call vam#ActivateAddons([
      \ 'github:mattn/zencoding-vim',
      \ 'github:FredKSchott/CoVim',
      \ 'github:taiansu/InTermsOf.vim',
      \ 'github:Valloric/YouCompleteMe',
      \ 'github:SirVer/ultisnips',
      \ 'github:scrooloose/syntastic',
      \ 'github:scrooloose/nerdtree',
      \ 'github:epmatsw/ag.vim',
      \ 'github:kien/ctrlp.vim',
      \ 'github:godlygeek/tabular',
      \ 'github:tpope/vim-rails',
      \ 'github:tpope/vim-markdown',
      \ 'github:tpope/vim-surround',
      \ 'github:tpope/vim-repeat',
      \ 'github:tpope/vim-endwise',
      \ 'github:tpope/vim-fugitive',
      \ 'github:tpope/vim-commentary',
      \ 'github:tpope/vim-haml',
      \ 'github:tomtom/quickfixsigns_vim',
      \ 'github:myusuf3/numbers.vim',
      \ 'github:vim-scripts/matchit.zip',
      \ 'github:vim-scripts/ruby-matchit',
      \ 'github:kchmck/vim-coffee-script',
      \ 'github:nono/vim-handlebars',
      \ 'github:teramako/jscomplete-vim',
      \ 'github:vim-ruby/vim-ruby'
      \ ], {'auto_install' : 1})
endf
call SetupVAM()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENCODING SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1
set ffs=unix,mac,dos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FONT AND COLOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set gfn=Source\ Code\ Pro\ Light:h14

:set t_Co=256 " 256 colors
:set background=dark
:colorscheme smyck

highlight Pmenu ctermbg=94 guibg=#875F00
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set wrap
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" insert tabs on the start of a line according to context
set smarttab
" highlight current line
set cursorline
set cursorcolumn
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set winwidth=79
" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" show the cursor wposition all the time
set ruler
" auto read when file is changed from outsideyy
set autoread
" This makes RVM work inside Vim. I have no idea why.
set shell=zsh
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=7
" Store temporary files in a central spot
set nobackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" display incomplete commands
set showcmd
" For regular expressions turn magic on
set magic
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
" fix long line render speed
set foldmethod=syntax
set foldlevelstart=3
set foldnestmax=3
let javaScript_fold=1
set linebreak
set showbreak=↪
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHT FIX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set synmaxcol=256
syntax sync minlines=256
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISABLE AUTOMATIC COMMENT INSERTION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType css,scss setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO TRAILING WHITE SPACES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType ruby,html,javascript,coffee,css,scss autocmd BufWritePre <buffer> :%s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHOW INVISIBLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=81
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


  " make CSS omnicompletion work for SASS and SCSS
  autocmd BufNewFile,BufRead *.json             set ft=javascript
  autocmd BufNewFile,BufRead *.coffee           set ft=coffee
  autocmd! BufNewFile,BufRead *.scss,*.sass      set ft=scss.css
  autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,coffee,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd,md setlocal syn=off

  " Enable omni completion. (Ctrl-X Ctrl-O)
  autocmd FileType html,haml,markdown,handlebars setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType ruby compiler ruby
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <CR>
  autocmd! CmdwinLeave * :call MapNoHighlight()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM FILE COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Suw w !sudo tee % > /dev/null

command! -nargs=1 F call QuickFileType(<f-args>)
function! QuickFileType(file_type)
    let l:file_type = a:file_type

    if l:file_type == 'j'
        let l:file_type = 'javascript'
    elseif l:file_type == 'r'
        let l:file_type = 'ruby'
    elseif l:file_type == 'e'
        let l:file_type = 'eruby'
    elseif l:file_type == 'h'
        let l:file_type = 'html'
    elseif l:file_type == 'ha'
        let l:file_type = 'handlebars'
    elseif l:file_type == 's'
        let l:file_type = 'css'
    endif
    exec "setf ".l:file_type
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASH LIKE KEYS FOR THE COMMANDLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C->

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RESIZE SPLIT WINDOW
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Up> :res +2<CR>
map <Down> :res -2<CR>
map <Right> :vertical res +2<CR>
map <Left> :vertical res -2<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

set laststatus=2
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y
" Move around splits with <c-hjkl>
nnoremap <c-J> <c-w>j<c-w>_
nnoremap <c-K> <c-w>k<c-w>_
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
set winheight=5
set winminheight=5
set equalalways
set eadirection=both
" Insert a hash rocket with <c-f>
imap <c-f> <space>=><space>

" Clear the search buffer when hitting return
function! MapNoHighlight()
  map <leader>/ :nohlsearch<CR>
endfunction
call MapNoHighlight()
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
nnoremap <leader><leader> <c-^>
" format json
map <leader>j !python -m json.tool<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<CR>
" inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<CR>
"map <leader>e :edit %%
"map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>l :PromoteToLet<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction
vnoremap <leader>rv :call ExtractVariable()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INLINE VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InlineVariable()
    " Copy the variable under the cursor into the 'a' register
    :let l:tmp_a = @a
    :normal "ayiw
    " Delete variable and equals sign
    :normal 2daW
    " Delete the expression into the 'b' register
    :let l:tmp_b = @b
    :normal "bd$
    " Delete the remnants of the line
    :normal dd
    " Go to the end of the previous line so we can start our search for the
    " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
    " work; I'm not sure why.
    normal k$
    " Find the next occurence of the variable
    exec '/\<' . @a . '\>'
    " Replace that occurence with the text we yanked
    exec ':.s/\<' . @a . '\>/' . @b
    :let @a = l:tmp_a
    :let @b = l:tmp_b
endfunction
nnoremap <leader>ri :call InlineVariable()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC CtrlP TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction

map <leader>gR :call ShowRoutes()<CR>
map <leader>gv :CtrlPClearCache<CR>\|:CtrlP app/views<CR>
map <leader>gc :CtrlPClearCache<CR>\|:CtrlP app/controllers<CR>
map <leader>gm :CtrlPClearCache<CR>\|:CtrlP app/models<CR>
map <leader>gh :CtrlPClearCache<CR>\|:CtrlP app/helpers<CR>
map <leader>ga :CtrlPClearCache<CR>\|:CtrlP app/assets<CR>
map <leader>gs :CtrlPClearCache<CR>\|:CtrlP spec/<CR>
map <leader>gl :CtrlPClearCache<CR>\|:CtrlP lib<CR>
map <leader>gp :CtrlPClearCache<CR>\|:CtrlP public<CR>
map <leader>gf :CtrlPClearCache<CR>\|:CtrlP features<CR>
map <leader>gr :topleft :split config/routes.rb<CR>
map <leader>gg :topleft 100 :split Gemfile<CR>
map <leader>gt :CtrlPClearCache<CR>\|CtrlPTag<CR>
map <leader>f :CtrlPClearCache<CR>\|:CtrlP<CR>
map <leader>F :CtrlPClearCache<CR>\|:CtrlP %%<CR>
map <leader>z z5<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! OpenTestAlternate()
"   let new_file = AlternateForCurrentFile()
"   exec ':e ' . new_file
" endfunction
" function! AlternateForCurrentFile()
"   let current_file = expand("%")
"   let new_file = current_file
"   let in_spec = match(current_file, '^spec/') != -1
"   let going_to_spec = !in_spec
"   let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
"   if going_to_spec
"     if in_app
"       let new_file = substitute(new_file, '^app/', '', '')
"     end
"     let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
"     let new_file = 'spec/' . new_file
"   else
"     let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
"     let new_file = substitute(new_file, '^spec/', '', '')
"     if in_app
"       let new_file = 'app/' . new_file
"     end
"   endif
"   return new_file
" endfunction
" nnoremap <leader>. :call OpenTestAlternate()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow multiple indentation/deindentation in visual mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interact with GUI clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Addons Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- Numbers.vim
nnoremap <C-n> :NumbersToggle<CR>

" --- CtrlP
" sets local working directory as the nearest ancestor
" that contains one of these directories or files: .git/
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'

"exclude directories or files from the search
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.exe$\|\.so$\|\.dll$',
\ 'link': 'some_bad_symbolic_links',
\ }

" --- Tabular
nmap <leader>b :Tabularize /
vmap <leader>b :Tabularize /

" ---JavaScript Syntax
let g:javascript_enable_domhtmlcss = 1 "Enable html,css syntax Highlight in js

" ---NerdTree
map <leader>q :NERDTreeToggle<CR>

" ---rails.vim
"map <leader>u :Rtags<CR>

" Always edit file, even when swap file is found
set shortmess+=A

" Search Dash for word under cursor
function! SearchDash()
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = "dash://".s:wordUnderCursor
  let s:cmd = "silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <leader>d :call SearchDash()<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
