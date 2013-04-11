use v6;

# specification: http://www.w3.org/TR/2011/REC-CSS2-20110607/propidx.html

use CSS::Extensions::CSS1;

grammar CSS::Extensions::CSS21::Syntax {
    # no syntax extensions yet
}

grammar CSS::Extensions::CSS21:ver<20110607.000> 
    is CSS::Extensions::CSS1 
    is CSS::Extensions::CSS21::Syntax {

    # --- Functions --- #

    rule function:sym<attr>     {:i'attr(' [ <attribute_name=.ident> <type_or_unit=.ident>? [ ',' <fallback=.ident> ]? || <any_args>] ')'}
    rule function:sym<counter>  {:i'counter(' [ <ident> [ ',' <ident> ]* || <any_args> ] ')'}
    rule function:sym<counters> {:i'counters(' [ <ident> [ ',' <string> ]? || <any_args> ] ')' }

    # --- Properties --- #

    rule decl:sym<azimuth> {:i (azimuth) ':' [
                                 <angle>
                                 | [[$<lr>=[ left\-side | far\-left | left | center\-left | center | center\-right | right | far\-right | right\-side ] $<bh>='behind'? | $<bh>=behind ]]
                                 | $<delta>=[$<dl>=leftwards | $<dr>=rightwards]
                                 | <inherit> || <any_args> ]}

    # - clip: <shape> | auto
    # interim <shape> token. need to be properly prototyped, etc
    token shape {:i'rect(' <expr> ')'}
    rule decl:sym<clip> {:i (clip) ':' [
                              <shape>
                              | auto  & <ident>
                                 | <inherit> || <any_args> ]}
    rule decl:sym<elevation> {:i (elevation) ':' [
                                   <angle>
                                   | $<tilt>=[below | level | above]
                                   | $<delta>=[ $<dh>=higher | $<dl>=lower ]
                                   | <inherit> || <any_args> ]}

}

