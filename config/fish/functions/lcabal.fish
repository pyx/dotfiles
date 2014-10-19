# shortcut function - lcabal
function lcabal --description 'cabal with TMPDIR set as ./tmp'
    set -lx TMPDIR (pwd)/tmp
    cabal $argv
end
