static const char norm_fg[] = "#c7b0c0";
static const char norm_bg[] = "#0F0915";
static const char norm_border[] = "#8b7b86";

static const char sel_fg[] = "#c7b0c0";
static const char sel_bg[] = "#D1AE4D";
static const char sel_border[] = "#c7b0c0";

static const char urg_fg[] = "#c7b0c0";
static const char urg_bg[] = "#B36431";
static const char urg_border[] = "#B36431";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
