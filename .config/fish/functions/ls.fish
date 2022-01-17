# Defined via `source`
function ls --wraps=gls --description 'alias ls=gls -h --hyperlink --color'
  gls -h --almost-all --hyperlink --color $argv; 
end
