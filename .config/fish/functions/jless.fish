# Defined via `source`
function jless --wraps='jq -C . | less -R' --description 'alias jless=jq -C . | less -R'
  jq -C . | less -R $argv; 
end
