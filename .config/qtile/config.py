#    __    ___________   _   ______________
#   / /   / ____/ ___/  / | / / ____/_  __/
#  / /   / /_   \__ \  /  |/ / __/   / /
# / /___/ __/  ___/ / / /|  / /___  / /
#/_____/_/    /____(_)_/ |_/_____/ /_/
# https://LFrigoDeSouza.NET
# https://github.com/lfrigodesouza/Dotfiles
# 
# Configuration file for QTile Window Manager

import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    #Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    #Key([mod], "space", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "space", lazy.spawn("rofi -show combi -show-icons -monitor -1"), desc="Spawn a command using a prompt widget"),
    Key([mod], "q", lazy.next_screen(), desc="Change focus to the next screen"),
    Key([mod], "e", lazy.spawn("pcmanfm"), desc="Run file manager"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.MonadTall(
        margin=3,
        border_focus="#50fa7b"
    ),
    layout.Max(),
    #layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    #layout.Bsp(),
    #layout.Matrix(),
    layout.MonadWide(
        margin=3,
        border_focus="#50fa7b"
    ),
    #layout.RatioTile(),
    #layout.Tile(),
    #layout.TreeTab(
    #    margin=4
    #),
    #layout.VerticalTile(),
    #layout.Zoomy(),
]

# Default colors
dracula = {
    "background": ['#282a36','#282a36'],
    "background_light": ['#44475a','#44475a'],
    "foreground": ['#f8f8f2','#f8f8f2'],
    "foreground_darker": ['#6272a4','#6272a4'],
    "cyan": ['#8be9fd','#8be9fd'],
    "green": ['#50fa7b','#50fa7b'],
    "orange": ['#ffb86c','#ffb86c'],
    "pink": ['#ff79c6','#ff79c6'],
    "purple": ['#bd93f9','#bd93f9'],
    "red": ['#ff5555','#ff5555'],
    "yellow": ['#f1fa8c','#f1fa8c'],
    "black": ['#000000','#000000'],
    }

widget_defaults = dict(
    font="Fira Code Nerd Font",
    fontsize=13,
    padding=2,
    background=dracula["background"],
    foreground=dracula["purple"],
)
extension_defaults = widget_defaults.copy()

### TOPBAR ###
#Default font size
fontsize=13

def get_widgets(primary=False):
    widgets=[
        widget.CurrentScreen(
            width=25,
            fontsize=20,
            active_text="",
            active_color=dracula["cyan"],
            inactive_text="",
            inactive_color=dracula["background_light"],
            background=dracula["foreground_darker"],
        ),
        widget.CurrentLayoutIcon(
            scale=0.7,
            background=dracula["foreground_darker"],
        ),
        widget.GroupBox(
            background=dracula["foreground_darker"],
            hide_unused=True,
            borderwidth=2,
            this_current_screen_border=dracula["green"],
            this_screen_border=dracula["green"],
            other_current_screen_border=dracula["background_light"],
            other_screen_border=dracula["background_light"],
            highlight_color=dracula["green"],
        ),
        widget.TextBox(
            text="",
            fontsize=20,
            padding=0,
            foreground=dracula["foreground_darker"]
        ),
        widget.WindowName(
        ),
    ]
    if primary:
        widgets.extend([
            widget.KeyboardLayout(
                configured_keyboards=['br','us(intl)'],
                foreground=dracula["green"],
            ),
            widget.Sep(),
            widget.Wlan(
                format="直 {essid}",
            ),
            widget.Sep(),
            widget.Memory(
                format=" {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}"
            ),
            widget.Sep(),
            widget.CPU(
                format="  {freq_current}GHz {load_percent}%"
            ),
            widget.Sep(),
            widget.CheckUpdates(
                no_update_string=" Updated",
                have_update_string=" Updates Available",
                colour_no_updates=dracula["purple"],
                colour_have_updates=dracula["green"],
            ),
            widget.Sep(),
            widget.Systray(),
            widget.Sep(),
            widget.PulseVolume(
                fmt="{}"
            ),
            widget.Sep(),
            widget.Battery(
                format= "{char} {percent:2.0%}",
                discharge_char="",
                charge_char="",
                empty_char="",
                full_char="",
                unknown_char=""
            ),
            widget.Sep(),
            widget.Clock(
                format=" %Y-%m-%d %a %H:%M"
            ),
        ])

    return widgets

# Topbar screen configurations
screens = [
    Screen(
        top=bar.Bar(
            get_widgets(primary=True),
            25,
            margin=1,
            opacity=0.9
        ),
    ),
    Screen(
        top=bar.Bar(
            get_widgets(primary=False),
            25,
            margin=1,
            opacity=0.9
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class="blueberry.py"),
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

### HOOKS ###
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.bin/qtile_autostart.sh')
    subprocess.Popen([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
