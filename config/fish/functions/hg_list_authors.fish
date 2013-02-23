# Helper function

function hg_list_authors --description 'list all authors'
	hg log --template '{author|email}\t{author|person}\n' ^/dev/null | uniq
end
