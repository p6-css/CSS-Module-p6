use v6;

use CSS::Specification::Build;
use CSS::Module;
use CSS::Module::CSS3;
use CSS::Module::CSS3::Fonts::AtFontFace;

class Build {

    method build($where) {

        indir $where, {

            my %props;
            my $actions = CSS::Module::CSS3::Actions.new;

            for (:CSS1[<etc css1-properties.txt> => <CSS1>],
                 :CSS21[<etc css21-properties.txt> => <CSS21>],
                 :CSS3[<etc css3x-font-properties.txt> => <CSS3 Fonts>,
                       <etc css3x-paged-media.txt> => <CSS3 PagedMedia>],
                 'CSS3::Fonts::AtFontFace' => [<etc css3x-font-@fontface-properties.txt> => <CSS3 Fonts AtFontFace>],

                ) {
                my $meta = .key;
                for .value.list {
                    my ($input-spec, $class-isa) = .kv;
                    my $grammar = CSS::Module::CSS3;
                    if $class-isa[*-1] eq 'AtFontFace' {
                        $grammar = CSS::Module::CSS3::Fonts::AtFontFace;
                        %props = ();
                    }

                    for (:interface<Interface>,
                         :actions<Actions> ,
                         :grammar<Grammar>) {
                        my ($type, $subclass) = .kv;
                        my $name = (<CSS Module>, @$class-isa, <Spec>, $subclass).flat.join('::');

                        my $class-dir = $*SPEC.catdir(<lib CSS Module>, @$class-isa, <Spec>);
                        mkdir $class-dir;

                        my $class-path = $*SPEC.catfile( $class-dir, $subclass~'.pm' );

                        my $input-path = $*SPEC.catfile( |@$input-spec );
                        say "Building $input-path => $name";
                        {
                            my $*IN = open $input-path, :r;
                            my $*OUT = open $class-path, :w;

                            CSS::Specification::Build::generate( $type, $name );
                        }

                        my @summary = CSS::Specification::Build::summary( :$input-path );
                        for @summary {
                            my %prop = %$_;
                            my $prop-name = %prop<name>:delete;
                            with %prop<default> -> $default {
                                my @d = $default;
                                # either a description or concrete term
                                if $default !~~ /agent/ {
                                    @d.push: .ast<property><expr>
                                        with $grammar.parse("$prop-name:$default", :$actions, :rule<declaration>);
                                }
                                %prop<default> = @d;
                            }
                            %props{$prop-name} = %prop;
                        }
                    }
                }
                my $class-dir = $*SPEC.catdir(flat(<lib CSS Module>, $meta.split('::')));
                my $class-path = $*SPEC.catfile( $class-dir, 'Metadata.pm' );
                my $class-name = "CSS::Module::{$meta}::Metadata";
                say "Building $class-name";
                {
                    my $*OUT = open $class-path, :w;
                    say 'use v6;';
                    say "#  -- DO NOT EDIT --";
                    say "# generated by: $*PROGRAM-NAME {@*ARGS}";
                    say '';
                    say "module $class-name \{";
                    say "    BEGIN our \$property = {%props.item.perl};";
                    say '}';
                }
            }
        }
    }
}

# Build.pm can also be run standalone 
sub MAIN(Str $working-directory = '.' ) {
    Build.new.build($working-directory);
}
