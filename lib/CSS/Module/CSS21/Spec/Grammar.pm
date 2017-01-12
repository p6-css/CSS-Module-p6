use v6;
#  -- DO NOT EDIT --
# generated by: make-modules.pl 

grammar CSS::Module::CSS21::Spec::Grammar {

    #| azimuth: <angle> | [[ left-side | far-left | left | center-left | center | center-right | right | far-right | right-side ] || behind ] | leftwards | rightwards
    rule decl:sym<azimuth> {:i (azimuth) ':' <val( rx{ <expr=.expr-azimuth> }, &?ROUTINE.WHY)> }
    rule expr-azimuth {:i :my @*SEEN; [ <angle> || [ [ [ [ left\-side | far\-left | left | center\-left | center | center\-right | right | far\-right | right\-side ] & <keyw> ] <!seen(0)> | behind & <keyw> <!seen(1)> ]+ ] || [ leftwards | rightwards ] & <keyw> ] }

    #| background-attachment: scroll | fixed
    rule decl:sym<background-attachment> {:i (background\-attachment) ':' <val( rx{ <expr=.expr-background-attachment> }, &?ROUTINE.WHY)> }
    rule expr-background-attachment {:i [ scroll | fixed ] & <keyw> }

    #| background-color: <color> | transparent
    rule decl:sym<background-color> {:i (background\-color) ':' <val( rx{ <expr=.expr-background-color> }, &?ROUTINE.WHY)> }
    rule expr-background-color {:i [ <color> || transparent & <keyw> ] }

    #| background-image: <uri> | none
    rule decl:sym<background-image> {:i (background\-image) ':' <val( rx{ <expr=.expr-background-image> }, &?ROUTINE.WHY)> }
    rule expr-background-image {:i [ <uri> || none & <keyw> ] }

    #| background-position: [ [ <percentage> | <length> | <align> ] [ <percentage> | <length> | <valign> ]? ] | [ <align> || <valign> ]
    rule decl:sym<background-position> {:i (background\-position) ':' <val( rx{ <expr=.expr-background-position> }, &?ROUTINE.WHY)> }
    rule expr-background-position {:i :my @*SEEN; [ [ [ [ <percentage> || <length> || <align> ] ] [ [ <percentage> || <length> || <valign> ] ]? ] || [ [ <align> <!seen(0)> | <valign> <!seen(1)> ]+ ] ] }

    #| align: left | center | right
    rule align {:i [ left | center | right ] & <keyw> }

    #| valign: top | center | bottom
    rule valign {:i [ top | center | bottom ] & <keyw> }

    #| background-repeat: repeat | repeat-x | repeat-y | no-repeat
    rule decl:sym<background-repeat> {:i (background\-repeat) ':' <val( rx{ <expr=.expr-background-repeat> }, &?ROUTINE.WHY)> }
    rule expr-background-repeat {:i [ repeat | repeat\-x | repeat\-y | no\-repeat ] & <keyw> }

    #| background: ['background-color' || 'background-image' || 'background-repeat' || 'background-attachment' || 'background-position']
    rule decl:sym<background> {:i (background) ':' <val( rx{ <expr=.expr-background> }, &?ROUTINE.WHY)> }
    rule expr-background {:i :my @*SEEN; [ [ <expr-background-color> <!seen(0)> | <expr-background-image> <!seen(1)> | <expr-background-repeat> <!seen(2)> | <expr-background-attachment> <!seen(3)> | <expr-background-position> <!seen(4)> ]+ ] }

    #| border-collapse: collapse | separate
    rule decl:sym<border-collapse> {:i (border\-collapse) ':' <val( rx{ <expr=.expr-border-collapse> }, &?ROUTINE.WHY)> }
    rule expr-border-collapse {:i [ collapse | separate ] & <keyw> }

    #| border-color: [ <color> | transparent ]{1,4}
    rule decl:sym<border-color> {:i (border\-color) ':' <val( rx{ <expr=.expr-border-color>**1..4 }, &?ROUTINE.WHY)> }
    rule expr-border-color {:i [ [ <color> || transparent & <keyw> ] ] }

    #| border-spacing: <length> <length>?
    rule decl:sym<border-spacing> {:i (border\-spacing) ':' <val( rx{ <expr=.expr-border-spacing> }, &?ROUTINE.WHY)> }
    rule expr-border-spacing {:i <length> <length>? }

    #| border-style: <border-style>{1,4}
    rule decl:sym<border-style> {:i (border\-style) ':' <val( rx{ <expr=.expr-border-style>**1..4 }, &?ROUTINE.WHY)> }
    rule expr-border-style {:i <border-style> }

    #| border-style: none | hidden | dotted | dashed | solid | double | groove | ridge | inset | outset
    rule border-style {:i [ none | hidden | dotted | dashed | solid | double | groove | ridge | inset | outset ] & <keyw> }

    #| border-top: [ 'border-top-width' || 'border-top-style' || 'border-top-color' ]
    rule decl:sym<border-top> {:i (border\-top) ':' <val( rx{ <expr=.expr-border-top> }, &?ROUTINE.WHY)> }
    rule expr-border-top {:i :my @*SEEN; [ [ <expr-border-top-width> <!seen(0)> | <expr-border-top-style> <!seen(1)> | <expr-border-top-color> <!seen(2)> ]+ ] }

    #| border-right: [ 'border-right-width' || 'border-right-style' || 'border-right-color' ]
    rule decl:sym<border-right> {:i (border\-right) ':' <val( rx{ <expr=.expr-border-right> }, &?ROUTINE.WHY)> }
    rule expr-border-right {:i :my @*SEEN; [ [ <expr-border-right-width> <!seen(0)> | <expr-border-right-style> <!seen(1)> | <expr-border-right-color> <!seen(2)> ]+ ] }

    #| border-bottom: [ 'border-bottom-width' || 'border-bottom-style' || 'border-bottom-color' ]
    rule decl:sym<border-bottom> {:i (border\-bottom) ':' <val( rx{ <expr=.expr-border-bottom> }, &?ROUTINE.WHY)> }
    rule expr-border-bottom {:i :my @*SEEN; [ [ <expr-border-bottom-width> <!seen(0)> | <expr-border-bottom-style> <!seen(1)> | <expr-border-bottom-color> <!seen(2)> ]+ ] }

    #| border-left: [ 'border-left-width' || 'border-left-style' || 'border-left-color' ]
    rule decl:sym<border-left> {:i (border\-left) ':' <val( rx{ <expr=.expr-border-left> }, &?ROUTINE.WHY)> }
    rule expr-border-left {:i :my @*SEEN; [ [ <expr-border-left-width> <!seen(0)> | <expr-border-left-style> <!seen(1)> | <expr-border-left-color> <!seen(2)> ]+ ] }

    #| border-top-color: <color> | transparent
    rule decl:sym<border-top-color> {:i (border\-top\-color) ':' <val( rx{ <expr=.expr-border-top-color> }, &?ROUTINE.WHY)> }
    rule expr-border-top-color {:i [ <color> || transparent & <keyw> ] }

    #| border-right-color: <color> | transparent
    rule decl:sym<border-right-color> {:i (border\-right\-color) ':' <val( rx{ <expr=.expr-border-right-color> }, &?ROUTINE.WHY)> }
    rule expr-border-right-color {:i [ <color> || transparent & <keyw> ] }

    #| border-bottom-color: <color> | transparent
    rule decl:sym<border-bottom-color> {:i (border\-bottom\-color) ':' <val( rx{ <expr=.expr-border-bottom-color> }, &?ROUTINE.WHY)> }
    rule expr-border-bottom-color {:i [ <color> || transparent & <keyw> ] }

    #| border-left-color: <color> | transparent
    rule decl:sym<border-left-color> {:i (border\-left\-color) ':' <val( rx{ <expr=.expr-border-left-color> }, &?ROUTINE.WHY)> }
    rule expr-border-left-color {:i [ <color> || transparent & <keyw> ] }

    #| border-top-style: <border-style>
    rule decl:sym<border-top-style> {:i (border\-top\-style) ':' <val( rx{ <expr=.expr-border-top-style> }, &?ROUTINE.WHY)> }
    rule expr-border-top-style {:i <border-style> }

    #| border-right-style: <border-style>
    rule decl:sym<border-right-style> {:i (border\-right\-style) ':' <val( rx{ <expr=.expr-border-right-style> }, &?ROUTINE.WHY)> }
    rule expr-border-right-style {:i <border-style> }

    #| border-bottom-style: <border-style>
    rule decl:sym<border-bottom-style> {:i (border\-bottom\-style) ':' <val( rx{ <expr=.expr-border-bottom-style> }, &?ROUTINE.WHY)> }
    rule expr-border-bottom-style {:i <border-style> }

    #| border-left-style: <border-style>
    rule decl:sym<border-left-style> {:i (border\-left\-style) ':' <val( rx{ <expr=.expr-border-left-style> }, &?ROUTINE.WHY)> }
    rule expr-border-left-style {:i <border-style> }

    #| border-top-width: <border-width>
    rule decl:sym<border-top-width> {:i (border\-top\-width) ':' <val( rx{ <expr=.expr-border-top-width> }, &?ROUTINE.WHY)> }
    rule expr-border-top-width {:i <border-width> }

    #| border-right-width: <border-width>
    rule decl:sym<border-right-width> {:i (border\-right\-width) ':' <val( rx{ <expr=.expr-border-right-width> }, &?ROUTINE.WHY)> }
    rule expr-border-right-width {:i <border-width> }

    #| border-bottom-width: <border-width>
    rule decl:sym<border-bottom-width> {:i (border\-bottom\-width) ':' <val( rx{ <expr=.expr-border-bottom-width> }, &?ROUTINE.WHY)> }
    rule expr-border-bottom-width {:i <border-width> }

    #| border-left-width: <border-width>
    rule decl:sym<border-left-width> {:i (border\-left\-width) ':' <val( rx{ <expr=.expr-border-left-width> }, &?ROUTINE.WHY)> }
    rule expr-border-left-width {:i <border-width> }

    #| border-width: <border-width>{1,4}
    rule decl:sym<border-width> {:i (border\-width) ':' <val( rx{ <expr=.expr-border-width>**1..4 }, &?ROUTINE.WHY)> }
    rule expr-border-width {:i <border-width> }

    #| border-width: thin | medium | thick | <length>
    rule border-width {:i [ [ thin | medium | thick ] & <keyw> || <length> ] }

    #| border: [ 'border-width' || 'border-style' || 'border-color' ]
    rule decl:sym<border> {:i (border) ':' <val( rx{ <expr=.expr-border> }, &?ROUTINE.WHY)> }
    rule expr-border {:i :my @*SEEN; [ [ <expr-border-width> <!seen(0)> | <expr-border-style> <!seen(1)> | <expr-border-color> <!seen(2)> ]+ ] }

    #| bottom: <length> | <percentage> | auto
    rule decl:sym<bottom> {:i (bottom) ':' <val( rx{ <expr=.expr-bottom> }, &?ROUTINE.WHY)> }
    rule expr-bottom {:i [ <length> || <percentage> || auto & <keyw> ] }

    #| caption-side: top | bottom
    rule decl:sym<caption-side> {:i (caption\-side) ':' <val( rx{ <expr=.expr-caption-side> }, &?ROUTINE.WHY)> }
    rule expr-caption-side {:i [ top | bottom ] & <keyw> }

    #| clear: none | left | right | both
    rule decl:sym<clear> {:i (clear) ':' <val( rx{ <expr=.expr-clear> }, &?ROUTINE.WHY)> }
    rule expr-clear {:i [ none | left | right | both ] & <keyw> }

    #| clip: <shape> | auto
    rule decl:sym<clip> {:i (clip) ':' <val( rx{ <expr=.expr-clip> }, &?ROUTINE.WHY)> }
    rule expr-clip {:i [ <shape> || auto & <keyw> ] }

    #| color: <color>
    rule decl:sym<color> {:i (color) ':' <val( rx{ <expr=.expr-color> }, &?ROUTINE.WHY)> }
    rule expr-color {:i <color> }

    #| content: normal | none | [ <string> | <uri> | <counter> | <counters> | attr(<identifier>) | open-quote | close-quote | no-open-quote | no-close-quote ]+
    rule decl:sym<content> {:i (content) ':' <val( rx{ <expr=.expr-content> }, &?ROUTINE.WHY)> }
    rule expr-content {:i [ [ normal | none ] & <keyw> || [ [ <string> || <uri> || <counter> || <counters> || <attr> || [ open\-quote | close\-quote | no\-open\-quote | no\-close\-quote ] & <keyw> ] ]+ ] }

    #| counter-increment: none | [ <identifier> <integer>? ]+
    rule decl:sym<counter-increment> {:i (counter\-increment) ':' <val( rx{ <expr=.expr-counter-increment> }, &?ROUTINE.WHY)> }
    rule expr-counter-increment {:i [ none & <keyw> || [ <identifier> <integer>? ]+ ] }

    #| counter-reset: none | [ <identifier> <integer>? ]+
    rule decl:sym<counter-reset> {:i (counter\-reset) ':' <val( rx{ <expr=.expr-counter-reset> }, &?ROUTINE.WHY)> }
    rule expr-counter-reset {:i [ none & <keyw> || [ <identifier> <integer>? ]+ ] }

    #| cue-after: <uri> | none
    rule decl:sym<cue-after> {:i (cue\-after) ':' <val( rx{ <expr=.expr-cue-after> }, &?ROUTINE.WHY)> }
    rule expr-cue-after {:i [ <uri> || none & <keyw> ] }

    #| cue-before: <uri> | none
    rule decl:sym<cue-before> {:i (cue\-before) ':' <val( rx{ <expr=.expr-cue-before> }, &?ROUTINE.WHY)> }
    rule expr-cue-before {:i [ <uri> || none & <keyw> ] }

    #| cue: [ 'cue-before' || 'cue-after' ]
    rule decl:sym<cue> {:i (cue) ':' <val( rx{ <expr=.expr-cue> }, &?ROUTINE.WHY)> }
    rule expr-cue {:i :my @*SEEN; [ [ <expr-cue-before> <!seen(0)> | <expr-cue-after> <!seen(1)> ]+ ] }

    #| cursor: [ [<uri> ,]* [ auto | crosshair | default | pointer | move | e-resize | ne-resize | nw-resize | n-resize | se-resize | sw-resize | s-resize | w-resize | text | wait | help | progress ] ]
    rule decl:sym<cursor> {:i (cursor) ':' <val( rx{ <expr=.expr-cursor> }, &?ROUTINE.WHY)> }
    rule expr-cursor {:i [ [ <uri> <op(',')> ]* [ [ auto | crosshair | default | pointer | move | e\-resize | ne\-resize | nw\-resize | n\-resize | se\-resize | sw\-resize | s\-resize | w\-resize | text | wait | help | progress ] & <keyw> ] ] }

    #| direction: ltr | rtl
    rule decl:sym<direction> {:i (direction) ':' <val( rx{ <expr=.expr-direction> }, &?ROUTINE.WHY)> }
    rule expr-direction {:i [ ltr | rtl ] & <keyw> }

    #| display: inline | block | list-item | inline-block | table | inline-table | table-row-group | table-header-group | table-footer-group | table-row | table-column-group | table-column | table-cell | table-caption | none
    rule decl:sym<display> {:i (display) ':' <val( rx{ <expr=.expr-display> }, &?ROUTINE.WHY)> }
    rule expr-display {:i [ inline | block | list\-item | inline\-block | table | inline\-table | table\-row\-group | table\-header\-group | table\-footer\-group | table\-row | table\-column\-group | table\-column | table\-cell | table\-caption | none ] & <keyw> }

    #| elevation: <angle> | below | level | above | higher | lower
    rule decl:sym<elevation> {:i (elevation) ':' <val( rx{ <expr=.expr-elevation> }, &?ROUTINE.WHY)> }
    rule expr-elevation {:i [ <angle> || [ below | level | above | higher | lower ] & <keyw> ] }

    #| empty-cells: show | hide
    rule decl:sym<empty-cells> {:i (empty\-cells) ':' <val( rx{ <expr=.expr-empty-cells> }, &?ROUTINE.WHY)> }
    rule expr-empty-cells {:i [ show | hide ] & <keyw> }

    #| float: left | right | none
    rule decl:sym<float> {:i (float) ':' <val( rx{ <expr=.expr-float> }, &?ROUTINE.WHY)> }
    rule expr-float {:i [ left | right | none ] & <keyw> }

    #| font-family: [ <generic-family> | <family-name> ]#
    rule decl:sym<font-family> {:i (font\-family) ':' <val( rx{ <expr=.expr-font-family> }, &?ROUTINE.WHY)> }
    rule expr-font-family {:i [ [ <generic-family> || <family-name> ] ] +% <op(',')> }

    #| generic-family: serif | sans-serif | cursive | fantasy | monospace
    rule generic-family {:i [ serif | sans\-serif | cursive | fantasy | monospace ] & <keyw> }

    #| family-name: <identifiers> | <string>
    rule family-name {:i [ <identifiers> || <string> ] }

    #| font-size: <absolute-size> | <relative-size> | <length> | <percentage>
    rule decl:sym<font-size> {:i (font\-size) ':' <val( rx{ <expr=.expr-font-size> }, &?ROUTINE.WHY)> }
    rule expr-font-size {:i [ <absolute-size> || <relative-size> || <length> || <percentage> ] }

    #| absolute-size: xx-small | x-small | small | medium | large | x-large | xx-large
    rule absolute-size {:i [ xx\-small | x\-small | small | medium | large | x\-large | xx\-large ] & <keyw> }

    #| relative-size: larger | smaller
    rule relative-size {:i [ larger | smaller ] & <keyw> }

    #| font-style: normal | italic | oblique
    rule decl:sym<font-style> {:i (font\-style) ':' <val( rx{ <expr=.expr-font-style> }, &?ROUTINE.WHY)> }
    rule expr-font-style {:i [ normal | italic | oblique ] & <keyw> }

    #| font-variant: normal | small-caps
    rule decl:sym<font-variant> {:i (font\-variant) ':' <val( rx{ <expr=.expr-font-variant> }, &?ROUTINE.WHY)> }
    rule expr-font-variant {:i [ normal | small\-caps ] & <keyw> }

    #| font-weight: normal | bold | bolder | lighter | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900
    rule decl:sym<font-weight> {:i (font\-weight) ':' <val( rx{ <expr=.expr-font-weight> }, &?ROUTINE.WHY)> }
    rule expr-font-weight {:i [ [ normal | bold | bolder | lighter ] & <keyw> || [ 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900 ] & <number> ] }

    #| font: [ [ 'font-style' || 'font-variant' || 'font-weight' ]? 'font-size' [ / 'line-height' ]? 'font-family' ] | caption | icon | menu | message-box | small-caption | status-bar
    rule decl:sym<font> {:i (font) ':' <val( rx{ <expr=.expr-font> }, &?ROUTINE.WHY)> }
    rule expr-font {:i :my @*SEEN; [ [ [ [ <expr-font-style> <!seen(0)> | <expr-font-variant> <!seen(1)> | <expr-font-weight> <!seen(2)> ]+ ]? <expr-font-size> [ <op('/')> <expr-line-height> ]? <expr-font-family> ] || [ caption | icon | menu | message\-box | small\-caption | status\-bar ] & <keyw> ] }

    #| height: <length> | <percentage> | auto
    rule decl:sym<height> {:i (height) ':' <val( rx{ <expr=.expr-height> }, &?ROUTINE.WHY)> }
    rule expr-height {:i [ <length> || <percentage> || auto & <keyw> ] }

    #| left: <length> | <percentage> | auto
    rule decl:sym<left> {:i (left) ':' <val( rx{ <expr=.expr-left> }, &?ROUTINE.WHY)> }
    rule expr-left {:i [ <length> || <percentage> || auto & <keyw> ] }

    #| letter-spacing: normal | <length>
    rule decl:sym<letter-spacing> {:i (letter\-spacing) ':' <val( rx{ <expr=.expr-letter-spacing> }, &?ROUTINE.WHY)> }
    rule expr-letter-spacing {:i [ normal & <keyw> || <length> ] }

    #| line-height: normal | <number> | <length> | <percentage>
    rule decl:sym<line-height> {:i (line\-height) ':' <val( rx{ <expr=.expr-line-height> }, &?ROUTINE.WHY)> }
    rule expr-line-height {:i [ normal & <keyw> || <number> || <length> || <percentage> ] }

    #| list-style-image: <uri> | none
    rule decl:sym<list-style-image> {:i (list\-style\-image) ':' <val( rx{ <expr=.expr-list-style-image> }, &?ROUTINE.WHY)> }
    rule expr-list-style-image {:i [ <uri> || none & <keyw> ] }

    #| list-style-position: inside | outside
    rule decl:sym<list-style-position> {:i (list\-style\-position) ':' <val( rx{ <expr=.expr-list-style-position> }, &?ROUTINE.WHY)> }
    rule expr-list-style-position {:i [ inside | outside ] & <keyw> }

    #| list-style-type: disc | circle | square | decimal | decimal-leading-zero | lower-roman | upper-roman | lower-greek | lower-latin | upper-latin | armenian | georgian | lower-alpha | upper-alpha | none
    rule decl:sym<list-style-type> {:i (list\-style\-type) ':' <val( rx{ <expr=.expr-list-style-type> }, &?ROUTINE.WHY)> }
    rule expr-list-style-type {:i [ disc | circle | square | decimal | decimal\-leading\-zero | lower\-roman | upper\-roman | lower\-greek | lower\-latin | upper\-latin | armenian | georgian | lower\-alpha | upper\-alpha | none ] & <keyw> }

    #| list-style: [ 'list-style-type' || 'list-style-position' || 'list-style-image' ]
    rule decl:sym<list-style> {:i (list\-style) ':' <val( rx{ <expr=.expr-list-style> }, &?ROUTINE.WHY)> }
    rule expr-list-style {:i :my @*SEEN; [ [ <expr-list-style-type> <!seen(0)> | <expr-list-style-position> <!seen(1)> | <expr-list-style-image> <!seen(2)> ]+ ] }

    #| margin-right: <margin-width>
    rule decl:sym<margin-right> {:i (margin\-right) ':' <val( rx{ <expr=.expr-margin-right> }, &?ROUTINE.WHY)> }
    rule expr-margin-right {:i <margin-width> }

    #| margin-left: <margin-width>
    rule decl:sym<margin-left> {:i (margin\-left) ':' <val( rx{ <expr=.expr-margin-left> }, &?ROUTINE.WHY)> }
    rule expr-margin-left {:i <margin-width> }

    #| margin-top: <margin-width>
    rule decl:sym<margin-top> {:i (margin\-top) ':' <val( rx{ <expr=.expr-margin-top> }, &?ROUTINE.WHY)> }
    rule expr-margin-top {:i <margin-width> }

    #| margin-bottom: <margin-width>
    rule decl:sym<margin-bottom> {:i (margin\-bottom) ':' <val( rx{ <expr=.expr-margin-bottom> }, &?ROUTINE.WHY)> }
    rule expr-margin-bottom {:i <margin-width> }

    #| margin: <margin-width>{1,4}
    rule decl:sym<margin> {:i (margin) ':' <val( rx{ <expr=.expr-margin>**1..4 }, &?ROUTINE.WHY)> }
    rule expr-margin {:i <margin-width> }

    #| margin-width: <length> | <percentage> | auto
    rule margin-width {:i [ <length> || <percentage> || auto & <keyw> ] }

    #| max-height: <length> | <percentage> | none
    rule decl:sym<max-height> {:i (max\-height) ':' <val( rx{ <expr=.expr-max-height> }, &?ROUTINE.WHY)> }
    rule expr-max-height {:i [ <length> || <percentage> || none & <keyw> ] }

    #| max-width: <length> | <percentage> | none
    rule decl:sym<max-width> {:i (max\-width) ':' <val( rx{ <expr=.expr-max-width> }, &?ROUTINE.WHY)> }
    rule expr-max-width {:i [ <length> || <percentage> || none & <keyw> ] }

    #| min-height: <length> | <percentage>
    rule decl:sym<min-height> {:i (min\-height) ':' <val( rx{ <expr=.expr-min-height> }, &?ROUTINE.WHY)> }
    rule expr-min-height {:i [ <length> || <percentage> ] }

    #| min-width: <length> | <percentage>
    rule decl:sym<min-width> {:i (min\-width) ':' <val( rx{ <expr=.expr-min-width> }, &?ROUTINE.WHY)> }
    rule expr-min-width {:i [ <length> || <percentage> ] }

    #| opacity: <number>
    rule decl:sym<opacity> {:i (opacity) ':' <val( rx{ <expr=.expr-opacity> }, &?ROUTINE.WHY)> }
    rule expr-opacity {:i <number> }

    #| orphans: <integer>
    rule decl:sym<orphans> {:i (orphans) ':' <val( rx{ <expr=.expr-orphans> }, &?ROUTINE.WHY)> }
    rule expr-orphans {:i <integer> }

    #| outline-color: <color> | invert
    rule decl:sym<outline-color> {:i (outline\-color) ':' <val( rx{ <expr=.expr-outline-color> }, &?ROUTINE.WHY)> }
    rule expr-outline-color {:i [ <color> || invert & <keyw> ] }

    #| outline-style: [ none | hidden | dotted | dashed | solid | double | groove | ridge | inset | outset ]
    rule decl:sym<outline-style> {:i (outline\-style) ':' <val( rx{ <expr=.expr-outline-style> }, &?ROUTINE.WHY)> }
    rule expr-outline-style {:i [ [ none | hidden | dotted | dashed | solid | double | groove | ridge | inset | outset ] & <keyw> ] }

    #| outline-width: thin | medium | thick | <length>
    rule decl:sym<outline-width> {:i (outline\-width) ':' <val( rx{ <expr=.expr-outline-width> }, &?ROUTINE.WHY)> }
    rule expr-outline-width {:i [ [ thin | medium | thick ] & <keyw> || <length> ] }

    #| outline: [ 'outline-color' || 'outline-style' || 'outline-width' ]
    rule decl:sym<outline> {:i (outline) ':' <val( rx{ <expr=.expr-outline> }, &?ROUTINE.WHY)> }
    rule expr-outline {:i :my @*SEEN; [ [ <expr-outline-color> <!seen(0)> | <expr-outline-style> <!seen(1)> | <expr-outline-width> <!seen(2)> ]+ ] }

    #| overflow: visible | hidden | scroll | auto
    rule decl:sym<overflow> {:i (overflow) ':' <val( rx{ <expr=.expr-overflow> }, &?ROUTINE.WHY)> }
    rule expr-overflow {:i [ visible | hidden | scroll | auto ] & <keyw> }

    #| padding-top: <padding-width>
    rule decl:sym<padding-top> {:i (padding\-top) ':' <val( rx{ <expr=.expr-padding-top> }, &?ROUTINE.WHY)> }
    rule expr-padding-top {:i <padding-width> }

    #| padding-right: <padding-width>
    rule decl:sym<padding-right> {:i (padding\-right) ':' <val( rx{ <expr=.expr-padding-right> }, &?ROUTINE.WHY)> }
    rule expr-padding-right {:i <padding-width> }

    #| padding-bottom: <padding-width>
    rule decl:sym<padding-bottom> {:i (padding\-bottom) ':' <val( rx{ <expr=.expr-padding-bottom> }, &?ROUTINE.WHY)> }
    rule expr-padding-bottom {:i <padding-width> }

    #| padding-left: <padding-width>
    rule decl:sym<padding-left> {:i (padding\-left) ':' <val( rx{ <expr=.expr-padding-left> }, &?ROUTINE.WHY)> }
    rule expr-padding-left {:i <padding-width> }

    #| padding: <padding-width>{1,4}
    rule decl:sym<padding> {:i (padding) ':' <val( rx{ <expr=.expr-padding>**1..4 }, &?ROUTINE.WHY)> }
    rule expr-padding {:i <padding-width> }

    #| padding-width: <length> | <percentage>
    rule padding-width {:i [ <length> || <percentage> ] }

    #| page-break-after: auto | always | avoid | left | right
    rule decl:sym<page-break-after> {:i (page\-break\-after) ':' <val( rx{ <expr=.expr-page-break-after> }, &?ROUTINE.WHY)> }
    rule expr-page-break-after {:i [ auto | always | avoid | left | right ] & <keyw> }

    #| page-break-before: auto | always | avoid | left | right
    rule decl:sym<page-break-before> {:i (page\-break\-before) ':' <val( rx{ <expr=.expr-page-break-before> }, &?ROUTINE.WHY)> }
    rule expr-page-break-before {:i [ auto | always | avoid | left | right ] & <keyw> }

    #| page-break-inside: avoid | auto
    rule decl:sym<page-break-inside> {:i (page\-break\-inside) ':' <val( rx{ <expr=.expr-page-break-inside> }, &?ROUTINE.WHY)> }
    rule expr-page-break-inside {:i [ avoid | auto ] & <keyw> }

    #| pause-after: <time> | <percentage>
    rule decl:sym<pause-after> {:i (pause\-after) ':' <val( rx{ <expr=.expr-pause-after> }, &?ROUTINE.WHY)> }
    rule expr-pause-after {:i [ <time> || <percentage> ] }

    #| pause-before: <time> | <percentage>
    rule decl:sym<pause-before> {:i (pause\-before) ':' <val( rx{ <expr=.expr-pause-before> }, &?ROUTINE.WHY)> }
    rule expr-pause-before {:i [ <time> || <percentage> ] }

    #| pause: [ [<time> | <percentage>]{1,2} ]
    rule decl:sym<pause> {:i (pause) ':' <val( rx{ <expr=.expr-pause> }, &?ROUTINE.WHY)> }
    rule expr-pause {:i [ [ [ <time> || <percentage> ] ]**1..2 ] }

    #| pitch-range: <number>
    rule decl:sym<pitch-range> {:i (pitch\-range) ':' <val( rx{ <expr=.expr-pitch-range> }, &?ROUTINE.WHY)> }
    rule expr-pitch-range {:i <number> }

    #| pitch: <frequency> | x-low | low | medium | high | x-high
    rule decl:sym<pitch> {:i (pitch) ':' <val( rx{ <expr=.expr-pitch> }, &?ROUTINE.WHY)> }
    rule expr-pitch {:i [ <frequency> || [ x\-low | low | medium | high | x\-high ] & <keyw> ] }

    #| play-during: <uri> [ mix || repeat ]? | auto | none
    rule decl:sym<play-during> {:i (play\-during) ':' <val( rx{ <expr=.expr-play-during> }, &?ROUTINE.WHY)> }
    rule expr-play-during {:i :my @*SEEN; [ <uri> [ [ mix & <keyw> <!seen(0)> | repeat & <keyw> <!seen(1)> ]+ ]? || [ auto | none ] & <keyw> ] }

    #| position: static | relative | absolute | fixed
    rule decl:sym<position> {:i (position) ':' <val( rx{ <expr=.expr-position> }, &?ROUTINE.WHY)> }
    rule expr-position {:i [ static | relative | absolute | fixed ] & <keyw> }

    #| quotes: [<string> <string>]+ | none
    rule decl:sym<quotes> {:i (quotes) ':' <val( rx{ <expr=.expr-quotes> }, &?ROUTINE.WHY)> }
    rule expr-quotes {:i [ [ <string> <string> ]+ || none & <keyw> ] }

    #| richness: <number>
    rule decl:sym<richness> {:i (richness) ':' <val( rx{ <expr=.expr-richness> }, &?ROUTINE.WHY)> }
    rule expr-richness {:i <number> }

    #| right: <length> | <percentage> | auto
    rule decl:sym<right> {:i (right) ':' <val( rx{ <expr=.expr-right> }, &?ROUTINE.WHY)> }
    rule expr-right {:i [ <length> || <percentage> || auto & <keyw> ] }

    #| size: <length>{1,2} | auto | portrait | landscape
    rule decl:sym<size> {:i (size) ':' <val( rx{ <expr=.expr-size> }, &?ROUTINE.WHY)> }
    rule expr-size {:i [ <length>**1..2 || [ auto | portrait | landscape ] & <keyw> ] }

    #| speak-header: once | always
    rule decl:sym<speak-header> {:i (speak\-header) ':' <val( rx{ <expr=.expr-speak-header> }, &?ROUTINE.WHY)> }
    rule expr-speak-header {:i [ once | always ] & <keyw> }

    #| speak-numeral: digits | continuous
    rule decl:sym<speak-numeral> {:i (speak\-numeral) ':' <val( rx{ <expr=.expr-speak-numeral> }, &?ROUTINE.WHY)> }
    rule expr-speak-numeral {:i [ digits | continuous ] & <keyw> }

    #| speak-punctuation: code | none
    rule decl:sym<speak-punctuation> {:i (speak\-punctuation) ':' <val( rx{ <expr=.expr-speak-punctuation> }, &?ROUTINE.WHY)> }
    rule expr-speak-punctuation {:i [ code | none ] & <keyw> }

    #| speak: normal | none | spell-out
    rule decl:sym<speak> {:i (speak) ':' <val( rx{ <expr=.expr-speak> }, &?ROUTINE.WHY)> }
    rule expr-speak {:i [ normal | none | spell\-out ] & <keyw> }

    #| speech-rate: <number> | x-slow | slow | medium | fast | x-fast | faster | slower
    rule decl:sym<speech-rate> {:i (speech\-rate) ':' <val( rx{ <expr=.expr-speech-rate> }, &?ROUTINE.WHY)> }
    rule expr-speech-rate {:i [ <number> || [ x\-slow | slow | medium | fast | x\-fast | faster | slower ] & <keyw> ] }

    #| stress: <number>
    rule decl:sym<stress> {:i (stress) ':' <val( rx{ <expr=.expr-stress> }, &?ROUTINE.WHY)> }
    rule expr-stress {:i <number> }

    #| table-layout: auto | fixed
    rule decl:sym<table-layout> {:i (table\-layout) ':' <val( rx{ <expr=.expr-table-layout> }, &?ROUTINE.WHY)> }
    rule expr-table-layout {:i [ auto | fixed ] & <keyw> }

    #| text-align: <align> | justify
    rule decl:sym<text-align> {:i (text\-align) ':' <val( rx{ <expr=.expr-text-align> }, &?ROUTINE.WHY)> }
    rule expr-text-align {:i [ <align> || justify & <keyw> ] }

    #| text-decoration: none | [ underline || overline || line-through || blink ]
    rule decl:sym<text-decoration> {:i (text\-decoration) ':' <val( rx{ <expr=.expr-text-decoration> }, &?ROUTINE.WHY)> }
    rule expr-text-decoration {:i :my @*SEEN; [ none & <keyw> || [ [ underline & <keyw> <!seen(0)> | overline & <keyw> <!seen(1)> | line\-through & <keyw> <!seen(2)> | blink & <keyw> <!seen(3)> ]+ ] ] }

    #| text-indent: <length> | <percentage>
    rule decl:sym<text-indent> {:i (text\-indent) ':' <val( rx{ <expr=.expr-text-indent> }, &?ROUTINE.WHY)> }
    rule expr-text-indent {:i [ <length> || <percentage> ] }

    #| text-transform: capitalize | uppercase | lowercase | none
    rule decl:sym<text-transform> {:i (text\-transform) ':' <val( rx{ <expr=.expr-text-transform> }, &?ROUTINE.WHY)> }
    rule expr-text-transform {:i [ capitalize | uppercase | lowercase | none ] & <keyw> }

    #| top: <length> | <percentage> | auto
    rule decl:sym<top> {:i (top) ':' <val( rx{ <expr=.expr-top> }, &?ROUTINE.WHY)> }
    rule expr-top {:i [ <length> || <percentage> || auto & <keyw> ] }

    #| unicode-bidi: normal | embed | bidi-override
    rule decl:sym<unicode-bidi> {:i (unicode\-bidi) ':' <val( rx{ <expr=.expr-unicode-bidi> }, &?ROUTINE.WHY)> }
    rule expr-unicode-bidi {:i [ normal | embed | bidi\-override ] & <keyw> }

    #| vertical-align: baseline | sub | super | top | text-top | middle | bottom | text-bottom | <percentage> | <length>
    rule decl:sym<vertical-align> {:i (vertical\-align) ':' <val( rx{ <expr=.expr-vertical-align> }, &?ROUTINE.WHY)> }
    rule expr-vertical-align {:i [ [ baseline | sub | super | top | text\-top | middle | bottom | text\-bottom ] & <keyw> || <percentage> || <length> ] }

    #| visibility: visible | hidden | collapse
    rule decl:sym<visibility> {:i (visibility) ':' <val( rx{ <expr=.expr-visibility> }, &?ROUTINE.WHY)> }
    rule expr-visibility {:i [ visible | hidden | collapse ] & <keyw> }

    #| voice-family: [<generic-voice> | <specific-voice> ]#
    rule decl:sym<voice-family> {:i (voice\-family) ':' <val( rx{ <expr=.expr-voice-family> }, &?ROUTINE.WHY)> }
    rule expr-voice-family {:i [ [ <generic-voice> || <specific-voice> ] ] +% <op(',')> }

    #| generic-voice: male | female | child
    rule generic-voice {:i [ male | female | child ] & <keyw> }

    #| specific-voice: <identifier> | <string>
    rule specific-voice {:i [ <identifier> || <string> ] }

    #| volume: <number> | <percentage> | silent | x-soft | soft | medium | loud | x-loud
    rule decl:sym<volume> {:i (volume) ':' <val( rx{ <expr=.expr-volume> }, &?ROUTINE.WHY)> }
    rule expr-volume {:i [ <number> || <percentage> || [ silent | x\-soft | soft | medium | loud | x\-loud ] & <keyw> ] }

    #| white-space: normal | pre | nowrap | pre-wrap | pre-line
    rule decl:sym<white-space> {:i (white\-space) ':' <val( rx{ <expr=.expr-white-space> }, &?ROUTINE.WHY)> }
    rule expr-white-space {:i [ normal | pre | nowrap | pre\-wrap | pre\-line ] & <keyw> }

    #| widows: <integer>
    rule decl:sym<widows> {:i (widows) ':' <val( rx{ <expr=.expr-widows> }, &?ROUTINE.WHY)> }
    rule expr-widows {:i <integer> }

    #| width: <length> | <percentage> | auto
    rule decl:sym<width> {:i (width) ':' <val( rx{ <expr=.expr-width> }, &?ROUTINE.WHY)> }
    rule expr-width {:i [ <length> || <percentage> || auto & <keyw> ] }

    #| word-spacing: normal | <length>
    rule decl:sym<word-spacing> {:i (word\-spacing) ':' <val( rx{ <expr=.expr-word-spacing> }, &?ROUTINE.WHY)> }
    rule expr-word-spacing {:i [ normal & <keyw> || <length> ] }

    #| z-index: auto | <integer>
    rule decl:sym<z-index> {:i (z\-index) ':' <val( rx{ <expr=.expr-z-index> }, &?ROUTINE.WHY)> }
    rule expr-z-index {:i [ auto & <keyw> || <integer> ] }
}
