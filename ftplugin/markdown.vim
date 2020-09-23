if &compatible || v:version <= 704
            \ || exists('g:blank_vim_loaded')
    finish
endif
let g:blank_vim_loaded = v:true

command BlankLint call blank#Lint()
command BlankDiff call blank#Diff()
command BlankHi call blank#Hi()
