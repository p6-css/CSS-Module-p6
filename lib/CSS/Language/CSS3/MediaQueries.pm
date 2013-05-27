use v6;

# CSS3 Media Queries Extension Module
# - specification: http://www.w3.org/TR/2012/REC-css3-mediaqueries-20120619/
#
# The CSS3 Core includes some basic CSS2.1 compatible @media at rules. This
# module follows the latest W3C recommendations, to extend the syntax.
#
# -- if you want the capability to to embed '@page' rules, you'll also need
#    to load the Paged Media extension module in your class structure.
class CSS::Language::CSS3::MediaQueries::Actions {...}

use CSS::Language::CSS3::_Base;

grammar CSS::Language::CSS3::MediaQueries::Syntax {
    rule at-rule:sym<media> {(:i'media') <media-list> <media-rules> }

    rule media-rules {
        '{' ['@'<?before [:i'page']><at-rule>|<ruleset>]* <.end-block>
    }

    rule media-list  {<media-query> [',' <media-query>]*}
    rule media-query {[<media-op>? <media=.ident> | '(' <media-expr> ')']
                      [:i'and' '(' <media-expr> ')' ]*}
    rule media-op    {:i['only'|'not']}

    proto rule media-expr {<...>}

    rule media-expr:sym<width|height> {:i ([[min|max|device]\-]?[width|height]) ':' <val(rx:i:s[ <length> ])> }

    rule media-expr:sym<orientation> {:i (orientation) ':' <val(rx:i:s[ [ portrait | landscape ] & <keyw> ])> }

    rule media-expr:sym<aspect-ratio> {:i ([device\-]?aspect\-ratio) ':' <val(rx:i:s[ <horizontal=.integer> '/' <vertical=.integer> ])> }

    rule media-expr:sym<color> {:i ([min|max]\-color[\-index]?) ':' <val(rx:i:s[ <integer> ])> }

    rule media-expr:sym<monochrome> {:i ([min|max]\-monochrome) ':' <val(rx:i:s[ <integer> ])> }

    rule media-expr:sym<resolution> {:i ([min|max]\-resolution) ':' <val(rx:i:s[ <resolution> ])> }

    rule media-expr:sym<scan> {:i (scan) ':' <val(rx:i:s[ [ progressive | interlace] & <keyw> ])> }

    rule media-expr:sym<grid> {:i (grid) ':' <val(rx:i:s[ [0 | 1 ] & <integer> ])> }

    rule media-expr:sym<any>  { '(' <media-feature=.ident> [ ':' <expr> ]? ')' }

    rule media-expr:sym<bool> {:i (height|color[\-index]?|[device\-]?[width|height]|[device\-]?aspect\-ratio|monochrome|resolution|grid|none) }

}

grammar CSS::Language::CSS3::MediaQueries:ver<20120619.000>
    is CSS::Language::CSS3::MediaQueries::Syntax
    is CSS::Language::CSS3::_Base {
}

class CSS::Language::CSS3::MediaQueries::Actions
    is CSS::Language::CSS3::_Base::Actions {

    # media-rules, media-list, media-query, media see core actions
    method media-op($/)              { make $/.Str.lc }

    method media-expr:sym<width|height>($/) {
        return $.warning($0.Str.lc ~ ': length cannot be negative')
            if $<val> && $<val>.match(/\-/);
        make $._decl($0, $<val>, '<length>');
    }

    method media-expr:sym<bool>($/) {
        make $._decl($0, $/, '');
    }

    method media-expr:sym<orientation>($/) {
        make $._decl($0, $<val>, 'portrait | landscape');
    }

    method media-expr:sym<aspect-ratio>($/) {
        make $._decl($0, $<val>, '<horizontal> "/" <vertical>   (e.g. "16/9")');
    }

    method media-expr:sym<color>($/) {
        make $._decl($0, $<val>, '<integer>');
    }

    method media-expr:sym<monochrome>($/) {
        make $._decl($0, $<val>, '<integer>');
    }

    method media-expr:sym<resolution>($/) {
        make $._decl($0, $<val>, '<resolution>');
    }

    method media-expr:sym<scan>($/) {
        make $._decl($0, $<val>, 'progressive | interlace');
    }

    method media-expr:sym<grid>($/) {
        make $._decl($0, $<val>, '<integer>');
    }

    method media-expr:sym<any>($/)   {
        $.warning('unknown media-feature', $<media-feature>.ast);
        # todo - treat as 'not all'
    }
}
