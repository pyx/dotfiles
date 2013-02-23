# Helper function

function hg_list_archive_types --description 'list supported archive types'
	echo -e 'files\tA directory full of files'
	echo -e 'tar\tTar archive, uncompressed'
	echo -e 'tbz2\tTar archive, compressed using bzip2'
	echo -e 'tgz\tTar archive, compressed using gzip'
	echo -e 'uzip\tZip archive, uncompressed'
	echo -e 'zip\tZip archive, compressed using deflate'
end
