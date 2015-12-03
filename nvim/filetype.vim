" Definitions of different file types here

if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.inc		setfiletype cpp
    au! BufRead,BufNewFile *.cl 		setfiletype cpp
augroup END
