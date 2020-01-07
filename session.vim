let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/sandbox/elm/02
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/sandbox/elm/02
badd +1 src/Http.elm
badd +6 src/TextFields.elm
badd +1 src/Hello.elm
badd +1 src/RandomDice.elm
badd +1 src/Buttons.elm
badd +1 src/Main.elm
badd +80 src/Convert.elm
badd +7 src/GetGif.elm
badd +1 src/Getrequest.elm
badd +16 src/Watch.elm
badd +1 src/Form.elm
badd +1 elm-stuff/0.19.1/d.dat
argglobal
%argdel
$argadd ~/sandbox/elm/02
edit src/RandomDice.elm
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 136 + 136) / 272)
exe 'vert 2resize ' . ((&columns * 135 + 136) / 272)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
84
normal! zo
86
normal! zo
let s:l = 5 - ((4 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 0
lcd ~/sandbox/elm/02
wincmd w
argglobal
if bufexists("~/sandbox/elm/02/src/Watch.elm") | buffer ~/sandbox/elm/02/src/Watch.elm | else | edit ~/sandbox/elm/02/src/Watch.elm | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
55
normal! zo
57
normal! zo
94
normal! zo
let s:l = 82 - ((36 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
82
normal! 07|
lcd ~/sandbox/elm/02
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 136 + 136) / 272)
exe 'vert 2resize ' . ((&columns * 135 + 136) / 272)
tabedit ~/sandbox/elm/02/src/GetGif.elm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
54
normal! zo
56
normal! zo
60
normal! zo
61
normal! zo
90
normal! zo
92
normal! zo
let s:l = 120 - ((46 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
120
normal! 03|
lcd ~/sandbox/elm/02
tabedit ~/sandbox/elm/02/src/Getrequest.elm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 34 - ((33 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
34
normal! 09|
lcd ~/sandbox/elm/02
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
