" OPTIONS

set number          " Displays line number
set relativenumber  " Displays numeric relative to current line
set cursorline      " Highlight current line
set expandtab       " Use spaces in tab
set tabstop=4       " Set tab width
set softtabstop=4   " Set tab width
set shiftwidth=4    " Set tab width
set nowrap          " Disable line wrap
set matchpairs+=<:> " Highlight matching bracket
set pumblend=90     " Transparent autocomplete menu
set pumheight=15    " Limit visible autocomplete matches
set laststatus=2    " Show status line always
set showtabline=2   " Show tab line always
set tabline=Termux  " Tabline


" HIGHLIGHTING

hi LineNr       ctermfg=magenta      cterm=bold
hi CursorColumn ctermbg=red
hi CursorLine   cterm=bold
hi CursorLineNr ctermfg=lightmagenta cterm=bold,underline
hi MatchParen   ctermbg=darkgray
hi StatusLine   ctermfg=darkmagenta  ctermbg=darkgray cterm=bold,underline
hi StatusLineNc ctermfg=darkmagenta  ctermbg=black
hi TabLineSel   ctermfg=darkmagenta  ctermbg=darkgray
hi TabLineFill  ctermfg=darkmagenta  ctermbg=black cterm=underline
hi Pmenu        ctermfg=cyan         ctermbg=darkgray
hi PmenuSel     ctermfg=cyan         ctermbg=black cterm=bold,underline
hi PmenuSbar    ctermbg=darkgray
hi PmenuThumb   ctermbg=black


" KEYBINDS

inoremap " ""<esc>i
inoremap ' ''<esc>i
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap <s-up> <esc>ddkkpi
inoremap <s-down> <esc>ddpi
inoremap <s-left> <esc><<i
inoremap <s-right> <esc>>>i
inoremap <expr> <tab> completion.visible() ? '<c-n>' : '<tab>'


" FUNCTIONS

let cursor = {}
    fun! cursor.syntax_id() dict
        return synIDattr(synID(self.row(), self.column(), 1), 'name')
        endf

    fun! cursor.syntax_stack() dict
        return map(synstack(self.row(), self.column()), 'synIDattr(v:val, "name")')
        endf


let completion = {}
    fun! completion.visible() dict
        return pumvisible()
        endf
