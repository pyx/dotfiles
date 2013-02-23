# Helper function

function hg_list_compression_types --description 'list supported completion types'
	echo -e 'none\tNo compression'
	echo -e 'bzip2\tCompress using bzip2 (default)'
	echo -e 'gzip\tCompress using gzip'
end
