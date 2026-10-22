-- Variables

local color_focused   = "#81a1c1"
local color_unfocused = "#373e4d"

-- Displays

hl.monitor({
    output    = "DP-1",
    mode      = "highres@highrr",
    position  = "0x0",
    scale     = 1
})
hl.monitor({
    output    = "DP-2",
    mode      = "highres@highrr",
    position  = "3440x-268",
    scale     = 1,
    transform = 3
})

-- Window focus

hl.config({
    binds = {
        focus_preferred_method      = 1
    },
    input = {
        follow_mouse                = 2,
        float_switch_override_focus = 0
    },
    misc = {
        mouse_move_focuses_monitor  = false
    }
})

-- Input tuning

hl.config({
    input = {
        repeat_delay = 250,
        repeat_rate  = 40,
        sensitivity  = -0.5
    }
})

-- Layout

hl.config({
    general = {
        layout         = "master"
    },
    master = {
        mfact          = 0.575,
        smart_resizing = false
    }
})

-- Window visuals

hl.config({
    general = {
        gaps_out                      = 40,
        gaps_in                       = 20,
        border_size                   = 5,
        ["col.active_border"]         = color_focused,
        ["col.inactive_border"]       = color_unfocused
    },
    decoration = {
        rounding                      = 8,
        rounding_power                = 2,
        blur = {
            enabled                   = false,
            popups                    = true,
            popups_ignorealpha        = 0,
            input_methods             = true,
            input_methods_ignorealpha = 0
        },
        shadow = {
            enabled                   = false
        }
    }
})

-- Animations

hl.curve(
    "easeOutQuint",
    {
        type   = "bezier",
        points = { { 0.23, 1 }, { 0.32, 1 } }
    })
hl.curve(
    "almostLinear",
    {
        type   = "bezier",
        points = { { 0.5, 0.5 }, { 0.75, 1 } }
    })

hl.animation({
    leaf    = "global",
    enabled = true,
    speed   = 2,
    bezier  = "default"
})
hl.animation({
    leaf    = "windowsIn",
    enabled = true,
    speed   = 2,
    bezier  = "easeOutQuint",
    style   = "popin 80%"
})
hl.animation({
    leaf    = "windowsOut",
    enabled = true,
    speed   = 1,
    bezier  = "almostLinear",
    style   = "popin 90%"
})
hl.animation({
    leaf    = "windowsMove",
    enabled = true,
    speed   = 4,
    bezier  = "easeOutQuint"
})
hl.animation({
    leaf    = "layersIn",
    enabled = true,
    speed   = 2,
    bezier  = "easeOutQuint",
    style   = "fade"
})
hl.animation({
    leaf    = "layersOut",
    enabled = true,
    speed   = 1,
    bezier  = "almostLinear",
    style   = "fade"
})
hl.animation({
    leaf    = "fade",
    enabled = true,
    speed   = 2,
    bezier  = "easeOutQuint"
})
hl.animation({
    leaf    = "border",
    enabled = true,
    speed   = 2,
    bezier  = "easeOutQuint"
})
hl.animation({
    leaf    = "workspacesIn",
    enabled = true,
    speed   = 2,
    bezier  = "easeOutQuint",
    style   = "fade"
})
hl.animation({
    leaf    = "workspacesOut",
    enabled = true,
    speed   = 2,
    bezier  = "easeOutQuint",
    style   = "fade"
})

-- Miscellaneous settings

hl.config({
    ecosystem = {
        no_update_news           = true,
        no_donation_nag          = true
    },
    misc = {
        force_default_wallpaper  = 0,
        disable_hyprland_logo    = true,
        disable_splash_rendering = true
    }
})

-- Workspaces

hl.workspace_rule({
    workspace   = "1",
    monitor     = "DP-1",
    gaps_out    = { top = 40, right = 40, bottom = 40, left = 120 },
    default     = true
})
hl.workspace_rule({
    workspace   = "2",
    monitor     = "DP-1",
    gaps_out    = { top = 40, right = 40, bottom = 40, left = 120 }
})
hl.workspace_rule({
    workspace   = "3",
    monitor     = "DP-1",
    gaps_out    = { top = 40, right = 40, bottom = 40, left = 120 }
})
hl.workspace_rule({
    workspace   = "4",
    monitor     = "DP-1",
    gaps_out    = { top = 40, right = 40, bottom = 40, left = 120 }
})
hl.workspace_rule({
    workspace   = "5",
    monitor     = "DP-1",
    gaps_out    = { top = 40, right = 40, bottom = 40, left = 120 }
})

hl.workspace_rule({
    workspace   = "6",
    monitor     = "DP-2",
    layout_opts = { orientation = "top" },
    default     = true
})
hl.workspace_rule({
    workspace   = "7",
    monitor     = "DP-2",
    layout_opts = { orientation = "top" }
})
hl.workspace_rule({
    workspace   = "8",
    monitor     = "DP-2",
    layout_opts = { orientation = "top" }
})
hl.workspace_rule({
    workspace   = "9",
    monitor     = "DP-2",
    layout_opts = { orientation = "top" }
})
hl.workspace_rule({
    workspace   = "10",
    monitor     = "DP-2",
    layout_opts = { orientation = "top" }
})

-- Window rule: Prevent windows from maximizing themselves

hl.window_rule({
    match = {
        class      = ".*"
    },
    suppress_event = "maximize fullscreen"
})

-- Window rule: Put windows in floating mode upon creation

hl.window_rule({
    match = {
        float = false
    },
    float     = true,
    size      = { 1200, 900 },
    center    = true
})

-- Window rule: Fix dragging issues with XWayland

hl.window_rule({
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus       = true
})

-- Bindings

hl.bind(
    "SUPER + Delete",
    hl.dsp.window.close())

hl.bind(
    "SUPER + Slash",
    function()
        hl.dispatch(hl.dsp.window.float())
        hl.dispatch(hl.dsp.window.center())
    end)

hl.bind(
    "SUPER + Return",
    hl.dsp.window.fullscreen())

hl.bind(
    "SUPER + ALT + left",
    hl.dsp.window.resize({ x = -300, y = 0, relative = true }))
hl.bind(
    "SUPER + ALT + right",
    hl.dsp.window.resize({ x = 300, y = 0, relative = true }))
hl.bind(
    "SUPER + ALT + up",
    hl.dsp.window.resize({ x = 0, y = -300, relative = true }))
hl.bind(
    "SUPER + ALT + down",
    hl.dsp.window.resize({ x = 0, y = 300, relative = true }))

hl.bind(
    "SUPER + ALT + mouse:272",
    hl.dsp.window.resize(),
    { mouse = true })

hl.bind(
    "SUPER + SHIFT + left",
    hl.dsp.window.move({ direction = "left" }))
hl.bind(
    "SUPER + SHIFT + right",
    hl.dsp.window.move({ direction = "right" }))
hl.bind(
    "SUPER + SHIFT + up",
    hl.dsp.window.move({ direction = "up" }))
hl.bind(
    "SUPER + SHIFT + down",
    hl.dsp.window.move({ direction = "down" }))

hl.bind(
    "SUPER + SHIFT + 1",
    hl.dsp.window.move({ workspace = "1", follow = false }))
hl.bind(
    "SUPER + SHIFT + 2",
    hl.dsp.window.move({ workspace = "2", follow = false }))
hl.bind(
    "SUPER + SHIFT + 3",
    hl.dsp.window.move({ workspace = "3", follow = false }))
hl.bind(
    "SUPER + SHIFT + 4",
    hl.dsp.window.move({ workspace = "4", follow = false }))
hl.bind(
    "SUPER + SHIFT + 5",
    hl.dsp.window.move({ workspace = "5", follow = false }))
hl.bind(
    "SUPER + SHIFT + Q",
    hl.dsp.window.move({ workspace = "6", follow = false }))
hl.bind(
    "SUPER + SHIFT + W",
    hl.dsp.window.move({ workspace = "7", follow = false }))
hl.bind(
    "SUPER + SHIFT + E",
    hl.dsp.window.move({ workspace = "8", follow = false }))
hl.bind(
    "SUPER + SHIFT + R",
    hl.dsp.window.move({ workspace = "9", follow = false }))
hl.bind(
    "SUPER + SHIFT + T",
    hl.dsp.window.move({ workspace = "10", follow = false }))

hl.bind(
    "SUPER + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true })

hl.bind(
    "SUPER + left",
    function ()
        hl.dispatch(hl.dsp.focus({ direction = "left" }))
        hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
    end)
hl.bind(
    "SUPER + right",
    function ()
        hl.dispatch(hl.dsp.focus({ direction = "right" }))
        hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
    end)
hl.bind(
    "SUPER + up",
    function ()
        hl.dispatch(hl.dsp.focus({ direction = "up" }))
        hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
    end)
hl.bind(
    "SUPER + down",
    function ()
        hl.dispatch(hl.dsp.focus({ direction = "down" }))
        hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
    end)

hl.bind(
    "SUPER + tab",
    hl.dsp.exec_cmd("hyprland-toggle-focus-floating"))

hl.bind(
    "SUPER + 1",
    hl.dsp.focus({ workspace = "1" }))
hl.bind(
    "SUPER + 2",
    hl.dsp.focus({ workspace = "2" }))
hl.bind(
    "SUPER + 3",
    hl.dsp.focus({ workspace = "3" }))
hl.bind(
    "SUPER + 4",
    hl.dsp.focus({ workspace = "4" }))
hl.bind(
    "SUPER + 5",
    hl.dsp.focus({ workspace = "5" }))
hl.bind(
    "SUPER + Q",
    hl.dsp.focus({ workspace = "6" }))
hl.bind(
    "SUPER + W",
    hl.dsp.focus({ workspace = "7" }))
hl.bind(
    "SUPER + E",
    hl.dsp.focus({ workspace = "8" }))
hl.bind(
    "SUPER + R",
    hl.dsp.focus({ workspace = "9" }))
hl.bind(
    "SUPER + T",
    hl.dsp.focus({ workspace = "10" }))

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { repeating = true })
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { repeating = true })
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind(
    "SUPER + Escape",
    hl.dsp.exec_cmd("uwsm app -- ~/scripts/fuzzel_power.sh"))

hl.bind(
    "SUPER + ALT + Space",
    hl.dsp.exec_cmd("uwsm app -- ~/scripts/fuzzel_launcher.sh"))

hl.bind(
    "SUPER + SHIFT + Backspace",
    hl.dsp.exec_cmd("uwsm app -- grim -g \"$(slurp)\" ~/dump/$(date +\"screenshot_%s.png\")"))

-- On-start routines

hl.on("hyprland.start", function ()
    hl.exec_cmd("uwsm app -- wl-clip-persist --clipboard regular")
    hl.exec_cmd("uwsm app -- hyprpaper")
    hl.exec_cmd("uwsm app -- ~/scripts/eww_run.sh")
end)
