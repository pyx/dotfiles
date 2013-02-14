# setup prompt banner

function set_prompt_banner --description 'Set up prompt banner'
	if not test (count $argv) = 3
		echo 'usage: set_prompt_banner LEFT_END BAR_CHAR RIGHT_END'
		return 1
	end
	set --global prompt_banner_left_end $CC_LIGHT_CYAN$argv[1]
	set --global prompt_banner_left_end_length (echo -n $argv[1] | wc -c)

	set --global prompt_banner_bar_char $argv[2]

	set --global prompt_banner_right_end $CC_LIGHT_CYAN$argv[3]
	set --global prompt_banner_right_end_length (echo -n $argv[3] | wc -c)
end
