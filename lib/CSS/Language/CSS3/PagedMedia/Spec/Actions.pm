use v6;
#  -- DO NOT EDIT --
# generated by gen-properties.pl --class=CSS::Language::CSS3::PagedMedia::Spec::Actions etc/css3x-paged-media.txt
class CSS::Language::CSS3::PagedMedia::Spec::Actions {

#= size: <length>{1,2} | auto | [ <page-size> || [ portrait | landscape] ]
    method decl:sym<size>($/) { make $.decl($/, &?ROUTINE.WHY) }
    method size($/) { make $.node($/) }
}
