use v6;

grammar CSS::Language::_Base {
    # definitions common to CSS1, CSS21 and CSS3 Languages
    rule declaration:sym<validated> { <.ws>? <decl> <prio>? <any-arg>* <end-decl> }
    proto rule decl {*}

    # For handling undimensioned numbers and angles
    token length:sym<num> {<number>}
    token angle:sym<num>  {<number>}

    token integer     {[\+|\-]?<uint>}
    token uint        {\d+ <!before ['%'|\w|'.']>}
    token number      {<num> <!before ['%'|\w]>}
    token uri         {<url>}
    token keyw        {<ident>}             # keyword (case insensitive)
    token identifier  {<name>}              # identifier (case sensitive)
    rule identifiers  {[ <identifier> ]+}   # E.g. font name: Times New Roman

    token seen($opt) {
	<?{@*SEEN[$opt]++}>
    }
}
