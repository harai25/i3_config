set $mod Mod4

font pango:monospace 8

exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

exec --no-startup-id nm-applet

exec --no-startup-id amixer -q sset Master 100% on 

# exec --no-startup-id compton -b

exec --no-startup-id nitrogen --restore;

exec --no-startup-id xrandr --output HDMI-0 --mode 1920x1080 --right-of VGA-0

exec --no-startup-id sh ~/.fehbg &

exec --no-startup-id guake

floating_modifier $mod

bindsym $mod+Return exec i3-sensible-terminal 

bindsym $mod + F1 exec firefox
bindsym $mod + F2 exec code assign [class='code'] $ws2
bindsym $mod + Shift + F2 exec subl
bindsym $mod + F3 exec gnome-terminal -e vifm
bindsym $mod + Shift + F3 exec nautilus
bindsym $mod + F4 exec skypeforlinux
bindsym $mod + Shift + F4 exec telegram-desktop
bindsym $mod + F5 exec remmina

bindsym $mod+d exec --no-startup-id "rofi -show drun -font \\"DejaVu 9\\" -run-shell-command '{terminal} -e \\" {cmd}; read -n 1 -s\\"'"

# screenshot with scrot
bindsym --release Print exec scrot ~/Pictures/scr/screen-%Y-%m-%d-%H:%M:%S.jpg -s
bindsym Shift + Print exec scrot ~/Pictures/scr/screen-%Y-%m-%d-%H:%M:%S.jpg 

bindsym $mod+Shift+q kill

bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

#bindsym $mod+h split h

#bindsym $mod+v split v

bindsym $mod+z split toggle

bindsym $mod+f fullscreen toggle

bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

bindsym $mod+Shift+space floating toggle

bindsym $mod+space focus mode_toggle

bindsym $mod+a focus parent

bindsym $mod+c focus child

set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

bindsym $mod+Ctrl+1 move container to workspace number $ws1 
bindsym $mod+Ctrl+2 move container to workspace number $ws2
bindsym $mod+Ctrl+3 move container to workspace number $ws3
bindsym $mod+Ctrl+4 move container to workspace number $ws4
bindsym $mod+Ctrl+5 move container to workspace number $ws5
bindsym $mod+Ctrl+6 move container to workspace number $ws6
bindsym $mod+Ctrl+7 move container to workspace number $ws7
bindsym $mod+Ctrl+8 move container to workspace number $ws8
bindsym $mod+Ctrl+9 move container to workspace number $ws9
bindsym $mod+Ctrl+0 move container to workspace number $ws10

bindsym $mod+Shift+1 move container to workspace $ws1; workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2; workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3; workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4; workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5; workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6; workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7; workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8; workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws8; workspace $ws8

bindsym $mod+Shift+c reload

bindsym $mod+Shift+r restart

bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

mode "resize" {
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize shrink height 10 px or 10 ppt
        bindsym Up resize grow height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

set $mode_system System (Cntrl+s) suspend, (r) reboot, (Shift+s) shutdown, (e) exit, (l) lock
mode "$mode_system" {
    bindsym Ctrl+s exec suspend
    bindsym r exec reboot
    bindsym Shift+s exec shutdown now
    bindsym e exec i3-msg exit
    bindsym l exec i3lock -i ~/Pictures/wp/4.png; mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}            
bindsym $mod+Pause mode "$mode_system"
bindsym $mod+Caps_Lock exec i3lock -c 330066 -i ~/Pictures/wp/i3.png

bar {
        status_command i3status
	font xft:Sans, FontAwesome 10
}

floating_minimum_size 75 x 50
floating_maximum_size -1 x -1

# volume
mode "volume" {
        bindsym Up exec pactl set-sink-volume 0 150%; mode "default"
        bindsym Right exec amixer -q sset Master 100% on; mode "default"
        bindsym Down exec amixer -q sset Master 65% on; mode "default"

        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+v mode "default"
}
bindsym $mod+v mode "volume"

exec "setxkbmap -layout us,ru"
exec "setxkbmap -option 'grp:alt_shift_toggle'"

# gaps
# gaps inner 10
# gaps outer 0
# smart_gaps on

# bindsym $mod+s gaps inner current plus 4
# bindsym $mod+Shift+s gaps inner current minus 4
# bindsym $mod+x gaps outer current plus 4
# bindsym $mod+Shift+x gaps outer current minus 4
# bindsym $mod+t gaps inner all set 10; gaps outer all set 0
# bindsym $mod+shift+t gaps inner all set 0; gaps outer all set 0
# smart_borders on
default_border pixel

bindsym $mod+Shift+minus move scratchpad
bindsym $mod+minus scratchpad show
hide_edge_borders smart
