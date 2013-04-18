use v6;

# reference: http://www.w3.org/TR/2008/REC-CSS1-20080411/#css1-properties

use CSS::Grammar::CSS1;

grammar CSS::Language::CSS1:ver<20080411>
 is CSS::Grammar::CSS1 {

    # For handling undimensioned numbers and angles
    token length:sym<num> {<number>}
    token angle:sym<num>  {<number>}

    # allow color names and define our vocabulary
    rule color:sym<named>  {:i [aqua | black | blue | fuchsia | gray | green | lime | maroon | navy | olive | purple | red | silver | teal | white | yellow] & <keyw> }

    token integer    {[\+|\-]?\d+ <!before ['%'|\w|'.']>}
    token number     {<num> <!before ['%'|\w]>}
    token uri        {<url>}
    token keyw       {<ident>}     # keywords (case insensitive)
    token identifier {<ident-cs>}  # identifiers (case sensitive)

    # 5.2 Font Properties
    # -------------------
    # - font-family: [[<family-name> | <generic-family>],]* [<family-name> | <generic-family>]
    rule font-family {:i [ serif | sans\-serif | cursive | fantasy | monospace ] & <generic-family=.identifier> || [ <family-name=.identifier> ]+ | <family-name=.string> }
    rule decl:sym<font-family> {:i (font\-family) ':' [ <font-family> [ ',' <font-family> || <any> ]*
                                                        || <any-args> ] }

    # - font-style: normal | italic | oblique
    token font-style {:i [ normal | italic | oblique ] & <keyw> }
    rule decl:sym<font-style> {:i (font\-style) ':' [ <font-style>  || <any-args> ] }

    # - font-variant: normal | small-caps
    token font-variant {:i [ normal | small\-caps ] & <keyw>}
    rule decl:sym<font-variant> {:i (font\-variant) ':' [ <font-variant>
                                                          || <any-args> ] }
   # - font-weight: normal | bold | bolder | lighter | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900
    token font-weight {:i [ normal | bold | bolder | lighter ] & <keyw>
                           | [ 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900 ] & <number> }
    rule decl:sym<font-weight> {:i (font\-weight) ':' [ <font-weight>
                                                        || <any-args> ] }

    # - font-size: <absolute-size> | <relative-size> | <length> | <percentage>
    token absolute-size {:i [ [[xx|x]\-]?small | medium | [[xx|x]\-]?large ] & <keyw> }
    token relative-size {:i [ larger | smaller ] & <keyw> }
    token font-size {:i <absolute-size> | <relative-size> | <length> | <percentage> }
    rule decl:sym<font-size> {:i (font\-size) ':' [ <font-size>
                                                    || <any-args> ] }
    # - font: [ <font-style> || <font-variant> || <font-weight> ]? <font-size> [ / <line-height> ]? <font-family>
    rule decl:sym<font> {:i (font) ':' [
                              [  <font-style> | <font-variant> | <font-weight> ]* <font-size> [ '/' <line-height> ]? <font-family> [ ',' <font-family> ]*
                              || <any-args> ] }


    # 5.3 Color and background properties
    # -----------------------------------
    # - color: <color>
    rule decl:sym<color> {:i (color) ':' [ <color> || <any-args> ]}

    # - background-color: <color> | transparent
    token background-color {:i <color> | transparent & <keyw> }
    rule decl:sym<background-color> {:i (background\-color) ':' [ <background-color>
                                                                  || <any-args> ]}

    # - background-image: <url> | none
    token background-image {:i <url> | none & <keyw> }
    rule decl:sym<background-image> {:i (background\-image) ':' [ <background-image>
                                                                  || <any-args> ]}

    # - background-repeat: repeat | repeat-x | repeat-y | no-repeat
    token background-repeat {:i [ repeat[\-[x|y]]? | no\-repeat ] & <keyw> }
    rule decl:sym<background-repeat> {:i (background\-repeat) ':' [ <background-repeat>
                                                                    || <any-args> ]}


    # - background-attachment: scroll | fixed
    token background-attachment {:i [ scroll | fixed ] & <keyw> }
    rule decl:sym<background-attachment> {:i (background\-attachment) ':' [
                                               <background-attachment>
                                                || <any-args> ]}

    # - background-position: [<percentage> | <length>]{1,2} | [top | center | bottom] || [left | center | right]
    rule background-position {:i  [ <percentage> | <length> ]**1..2
                                  | [ [ top | center | bottom ] & <keyw>  
                                      | [ left | center | right ] & <keyw> ]+ }

    rule decl:sym<background-position> {:i (background\-position) ':' [ <background-position>
                                                                        || <any-args> ]}

    # - background: <background-color> || <background-image> || <background-repeat> || <background-attachment> || <background-position>
    rule decl:sym<background> {:i (background) ':' [
                                    [ <background-color> | <background-image> | <background-repeat> | <background-attachment> | <background-position> ]+
                                    || <any-args> ]}


    # 5.4 Text properties
    # -------------------
    # - word-spacing: normal | <length>
    # - letter-spacing: normal | <length>
    rule decl:sym<*-spacing> {:i ([word|letter]\-spacing) ':' [
                                   normal & <keyw> | <length>
                                    || <any-args> ]}

    # - text-decoration: none | [ underline || overline || line-through || blink ]
    rule decl:sym<text-decoration> {:i (text\-decoration) ':' [
                                         none & <keyw>
                                         | [[ underline | overline | line\-through | blink ] & <keyw> ]+
                                         || <any-args> ]}
    # - vertical-align: baseline | sub | super | top | text-top | middle | bottom | text-bottom | <percentage>
    rule decl:sym<vertical-align> {:i (vertical\-align) ':' [
                                        [ baseline | sub | super | top | text\-top | middle | bottom | text\-bottom ] & <keyw>
                                        | <percentage>
                                        || <any-args> ]}
    

    # - text-transform: capitalize | uppercase | lowercase | none
    rule decl:sym<text-transform> {:i (text\-transform) ':' [
                                        [ capitalize | uppercase | lowercase | none ] & <keyw>
                                        || <any-args> ]}

    # - text-align: left | right | center | justify
    rule decl:sym<text-align> {:i (text\-align) ':' [
                                    [ left | right | center | justify ] & <keyw>
                                    || <any-args> ]}

    # - text-indent: <length> | <percentage>
    rule decl:sym<text-indent> {:i (text\-indent) ':' [
                                     <length> | <percentage>
                                     || <any-args> ]}

    # - line-height: normal | <number> | <length> | <percentage>
    token line-height {:i normal & <keyw> | <number> | <length> | <percentage> }
    rule decl:sym<line-height> {:i (line\-height) ':' [ <line-height>
                                      || <any-args> ]}

    # 5.5 Box properties
    # ------------------
    # - margin-top: <length> | <percentage> | auto
    # - margin-right: <length> | <percentage> | auto
    # - margin-bottom: <length> | <percentage> | auto
    # - margin-left: <length> | <percentage> | auto
    rule decl:sym<margin-*> {:i (margin\-[top|right|bottom|left]) ':' [
                                  <length> | <percentage> | auto & <keyw> 
                                  || <any-args> ]}

    # - margin: [ <length> | <percentage> | auto ]{1,4}
    rule decl:sym<margin> {:i (margin) ':' [
                                [ <length> | <percentage> | auto & <keyw> ] ** 1..4
                                || <any-args> ]}

    # - padding-top: <length> | <percentage>
    # - padding-right: <length> | <percentage>
    # - padding-bottom: <length> | <percentage>
    # - padding-left: <length> | <percentage>
    rule decl:sym<padding-*> {:i (padding\-[top|right|bottom|left]) ':' [
                                   <length> | <percentage>
                                   || <any-args> ]}
 
    # - padding: [ <length> | <percentage> ]{1,4}
    rule decl:sym<padding> {:i (padding) ':' [
                                 [ <length> | <percentage> ] ** 1..4
                                 || <any-args> ]}

    # - border-top-width: thin | medium | thick | <length>
    # - border-right-width: thin | medium | thick | <length>
    # - border-bottom-width: thin | medium | thick | <length>
    # - border-left-width: thin | medium | thick | <length>
    rule decl:sym<border-*-width> {:i (border\-[top|right|bottom|left]\-width) ':' [
                                        [ thin | medium | thick ] & <keyw>
                                        | <length>
                                        || <any-args> ]}

    # - border-width: [thin | medium | thick | <length>]{1,4}
    token border-width {:i [ thin | medium | thick ] & <keyw> | <length> }
    rule decl:sym<border-width> {:i (border\-width) ':' [
                                      [ <border-width> ] ** 1..4
                                      || <any-args> ]}

    # - border-color: <color>{1,4}
    rule decl:sym<border-color> {:i (border\-color) ':' [
                                      [ <color> ] ** 1..4
                                      || <any-args> ]}

    # - border-style: none | dotted | dashed | solid | double | groove | ridge | inset | outset
    token border-style {:i [ none | dotted | dashed | solid | double | groove | ridge | inset | outset ] & <keyw> }
    rule decl:sym<border-style> {:i (border\-style) ':' [
                                      <border-style>
                                      || <any-args> ]}

    # - border-top: <border-width> || <border-style> || <color>
    # - border-right: <border-width> || <border-style> || <color>
    # - border-bottom: <border-width> || <border-style> || <color>
    # - border-left: <border-width> || <border-style> || <color>   
    # - border: <border-width> || <border-style> || <color>
    rule decl:sym<border-*> {:i (border[\-[top|right|bottom|left]]?) ':' [
                                  [ <border-width> | <border-style> | <color> ]+
                                  || <any-args> ]}

    # Positioning etc
    # - width: <length> | <percentage> | auto
    # - height: <length> | <percentage> | auto
    # - left: <length> | <percentage> | auto
    # - top: <length> | <percentage> | auto
    rule decl:sym<width|height|left|top> {:i (width|height|left|top) ':' [
                                               <length> | <percentage> | auto & <keyw>
                                               || <any-args> ]}

    # - float: left | right | none
    rule decl:sym<float> {:i (float) ':' [
                               [ left | right | none ] & <keyw>
                               || <any-args> ]}

    # - clear: none | left | right | both
    rule decl:sym<clear> {:i (clear) ':' [
                               [  none | left | right | both ] & <keyw>
                               || <any-args> ]}

    # 5.6 Classification properties
    # -----------------------------
    # - display: block | inline | list-item | none
    rule decl:sym<display> {:i (display) ':' [
                                 [ block | inline | list\-item | none ] & <keyw>
                                 || <any-args> ]}

    # - white-space: normal | pre | nowrap    
    rule decl:sym<white-space> {:i (white\-space) ':' [
                                     [ normal | pre | nowrap ] & <keyw>
                                     || <any-args> ]}

    # - list-style-type: disc | circle | square | decimal | lower-roman | upper-roman | lower-alpha | upper-alpha | none
    token list-style-type {:i [ disc | circle | square | decimal | lower\-roman | upper\-roman | lower\-alpha | upper\-alpha | none ] & <keyw> }
    rule decl:sym<list-style-type> {:i (list\-style\-type) ':' [
                                         <list-style-type>
                                         || <any-args> ]}

    # - list-style-image: <url> | none
    token list-style-image {:i  <uri> | none & <keyw> }
    rule decl:sym<list-style-image> {:i (list\-style\-image) ':' [
                                          <list-style-image>
                                          || <any-args> ]}

    # - list-style-position: inside | outside
    token list-style-position {:i  [ inside | outside ] & <keyw> }
    rule decl:sym<list-style-position> {:i (list\-style\-position) ':' [
                                             <list-style-position>
                                             || <any-args> ]}

    # - list-style: <keyword> || <position> || <url>
    rule decl:sym<list-style> {:i (list\-style) ':' [
                                    [ <list-style-type> | <list-style-image> | <list-style-position> ]+
                                    || <any-args> ]}

    # - position: absolute | relative | static
    rule decl:sym<position> {:i (position) ':' [
                                  [ absolute | relative | static ] & <keyw>
                                  || <any-args> ]}

    # - overflow: none | clip | scroll
    rule decl:sym<overflow> {:i (overflow) ':' [
                                  [ none | clip | scroll ] & <keyw>
                                  || <any-args> ]}

    # - z-index: auto | <integer>
    rule decl:sym<z-index> {:i (z\-index) ':' [
                                 <integer>
                                 || <any-args> ]}    
}
