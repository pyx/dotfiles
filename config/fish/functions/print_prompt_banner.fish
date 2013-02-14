# print prompt banner

function print_prompt_banner --description 'Print prompt banner'
	set term_width (tput cols)
	set prompt_banner_message_length (echo -n $prompt_banner_message | wc -c)
	set bar_length (math "($term_width - $prompt_banner_left_end_length - $prompt_banner_right_end_length - $prompt_banner_message_length) / 2 - 1")
	# elements to be displayed:
	# bar
	set bar $CC_RESET(head -c $bar_length < /dev/zero | tr '\0' $prompt_banner_bar_char)
	# left
	set lf $prompt_banner_left_end$bar
	# right
	set rt $bar$prompt_banner_right_end
	# banner message
	set bm $CC_WHITE'['"$prompt_color_banner_message$prompt_banner_message"$CC_WHITE']'

	echo -e "$lf$bm$rt$CC_RESET"
end
