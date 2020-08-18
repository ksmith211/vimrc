" Install plugged for managing dependencies:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" TODO: Incorporate UltiSnips for snippet/autocomplete expansions:
" https://github.com/sirver/UltiSnips

syntax on
filetype indent on
filetype plugin on
filetype on

set colorcolumn=0
"set mouse=a
set nofoldenable 
set wildignore+=*/build/**
set term=builtin_ansi
set makeprg=jslint\ %
set errorformat=%-P%f,
        \%E%>\ #%n\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,
        \%-G%f\ is\ OK.,%-Q
set nu
set hlsearch
set pastetoggle=<F3>
"set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

highlight Pmenu ctermfg=07 ctermbg=0 guifg=#ffffff guibg=#000000

silent! nmap <C-t> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
silent! nmap <C-m> :SyntasticToggleMode<CR>
silent! nmap <C-c> :SyntasticCheck<CR> 
"Paste in a way that won't freeze vim (requires pbpaste installed on system)
silent! nmap <C-p> :r! pbpaste<CR> 

autocmd BufReadPre,FileReadPre,Filetype gitcommit setlocal spell textwidth=72
autocmd BufReadPre,FileReadPre,FileType python set colorcolumn=120
autocmd BufReadPre,FileReadPre,FileType python  nmap <C-l> :PymodeLintAuto<CR> 
autocmd BufReadPre,FileReadPre,FileType python  nmap <C-o> :set colorcolumn=0<CR>
autocmd BufReadPre,FileReadPre,Filetype python set expandtab ts=4 sts=4 sw=4 ai
autocmd BufReadPre,FileReadPre,Filetype javascript set expandtab ts=2 sts=2 sw=2 ai
autocmd BufReadPre,FileReadPre,FileType javascript nmap <C-l> :! eslint --fix %:p<CR> 
autocmd BufReadPre,FileReadPre,Filetype bash set expandtab ts=2 sts=2 sw=2 ai

"visually select code block and type gq to autopep8
au FileType python setlocal formatprg=autopep8\ -

call pathogen#infect()
call pathogen#helptags()

call plug#begin('~/.vim/plugged')
"Autoread if files change on filesystem
Plug 'djoshea/vim-autoread'
"YouCompleteMe is off for now 
"It isn't required for javascript or python development
"Plug 'Valloric/YouCompleteMe'
Plug 'moll/vim-node'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"Ultisnips 
"Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'honza/vim-snippets'
Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/airblade/vim-rooter.git'
Plug 'scrooloose/nerdcommenter'

"JAVASCRIPT & PYTHON PLUGINS
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
"Plug 'scrooloose/syntastic'
"
Plug 'marijnh/tern_for_vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'mxw/vim-jsx'
Plug 'davidhalter/jedi-vim'
Plug 'fisadev/vim-isort'
Plug 'kchmck/vim-coffee-script'
Plug 'motus/pig.vim', {'for': 'pig'}
Plug 'derekwyatt/vim-sbt'
Plug 'leafgarland/typescript-vim'
Plug 'derekwyatt/vim-scala'
Plug 'tfnico/vim-gradle'
Plug 'digitaltoad/vim-jade', {'for': 'jade'}
Plug 'groenewege/vim-less'
Plug 'mustache/vim-mustache-handlebars', {'for': 'mustache'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug '~/my-prototype-plugin'
Plug 'flazz/vim-colorschemes'

call plug#end()

"Setup eslint for javascript/react/angular editing like so:
"npm install -g eslint
"npm install -g babel-eslint
"npm install -g eslint-plugin-react
"eslint init
"""Then answer the questions at the prompt

"Syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'perlcritic', 'podchecker']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height = 3

"python linter settings
let g:pymode=1
let g:pymode_options=1
let g:pymode_lint=1 
let g:pymode_lint_on_fly =1
let g:pymode_lint_message = 1
let g:pymode_options_max_line_length = 120
let g:vim_isort_map = '<C-i>'
"python autocomplete and other ide-like settings
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
let g:SuperTabClosePreviewOnPopupClose = 0
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = 1
let g:jedi#goto_command = "<leader>d"
let g:jedi#popup_select_first = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#auto_close_doc = 0

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

let g:ctrlp_map = '<leader>t'
let g:ctrlp_use_caching=0

"Set up ultisnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"custom colorscheme in autocomplete menus
highlight Pmenu ctermbg=DarkMagenta guibg=DarkMagenta ctermfg=Black guifg=Black
syntax on
hi Search ctermbg=LightYellow
