# Defined via `source`
function ls --wraps=gls --description 'alias ls=gls -h --hyperlink=auto --color'
  gls -h --almost-all --hyperlink=auto --color $argv; 
end
