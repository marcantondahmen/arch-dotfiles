#!/bin/bash

fg=c0caf5ff
bg=1f2335ff
dark3=545c7e66
green1=73dacaff
red=f7768eff
font="JetBrainsMono Nerd Font Mono"
fontSize=16

i3lock -c $bg \
	--force-clock \
	--radius 60 \
	--ring-width 6 \
	--inside-color $bg \
	--ring-color $dark3 \
	--insidever-color $bg \
	--ringver-color $green1 \
	--insidewrong-color $bg \
	--ringwrong-color $red \
	--line-color $bg \
	--keyhl-color $green1 \
	--bshl-color $red \
	--separator-color $bg \
	--verif-color $green1 \
	--wrong-color $red \
	--modif-color $green1 \
	--verif-text '' \
	--wrong-text '' \
	--noinput-text '' \
	--lockfailed-text '' \
	--greeter-text  \
	--greeter-font "$font" \
	--greeter-size 58 \
	--greeter-color $dark3 \
	--greeter-pos="w/2:(h/2)+17" \
	--date-color $dark3 \
	--date-font $font \
	--date-size $fontSize \
	--date-pos="w/2:h-30" \
	--date-str="%A, %B %d" \
	--time-color $dark3 \
	--time-font $font \
	--time-size $fontSize \
	--time-pos="w/2:h-52" \
	--time-str="%H:%m"
