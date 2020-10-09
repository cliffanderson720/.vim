function! YamlFolds()
	let thisline = getline(v:lnum)
	if match(thisline, '^\ *###')
		return ">3"
	elseif match(thisline, '^\ *##')
		return ">2"
	elseif match(thisline, '^\ *#')
		return ">1"
	"else
	"	return "="
	endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=YamlFolds()
