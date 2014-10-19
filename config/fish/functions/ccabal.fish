# shortcut function - ccabal
function ccabal --description 'cabal with TMPDIR set as ./tmp'
    bash -c "TMPDIR=\$(pwd)/tmp cabal $argv"
end
