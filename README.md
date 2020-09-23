# blank.vim
Made in Vimscript, September 2020.  
Created by [Kewbish](https://github.com/kewbish)  
Released under the MIT License.  

A Vim plugin for an English checklist. Named after creator of said checklist, Dr. Blank.  
You can get a copy of the checklist used at the [UVic page](http://web.uvic.ca/~gkblank/Blank's%20Writing%20Quirk%20List.pdf).  
These are common issues in English writing, and they're useful to keep in mind so you can ~~get better grades~~ improve your writing.

> :warning: This plugin is hyper-hyper-personalized. It's not very smart, but I don't really need a 'smart' checker, just one that can brute-force a list and hopefully get me better grades. Also, I wanted to learn a bit of Vimscript. And if it loads twice, or accidentally ruins your writing, I don't take any responsibility.

## Installation
Put the below line in your vimrc in the usual place [Vim-Plug version, adapt for whatever plugin manager you use.]
```vim
Plug 'kewbish/blank.vim'
```
Alternatively, you can extract and place the files in the appropriate places.

## Usage
blank.vim has three callable commands:
- `:BlankLint`, which creates a new copy of your file under `[name]-blank-diff.[extension]`, and sed-replaces all the quirks out. This results in very broken grammar, due to the fact that it doesn't 'intelligently' remove things. If you choose to use this, you might want to double and triple check your piece before submission.
- `:BlankDiff` runs BlankLint, and opens your files in diff mode, so you can see exactly what's changed. Probably useful to avoid obvious words missing.
- `:BlankHi` highlights all the quirks found in a reddish underline [doesn't run on default] so you can fix as you write.

