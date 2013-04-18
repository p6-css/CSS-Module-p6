#!/usr/bin/env perl6

use Test;

use CSS::Language::CSS21;
use CSS::Language::CSS21::Actions;
use lib '.';
use t::AST;

my $css_actions = CSS::Language::CSS21::Actions.new;

for (
    decl => {input => 'azimuth: 30deg',
             ast => {"property" => "azimuth",
                     "expr" => ["angle" => 30],
                     "_result" => "angle" => 30},
    },
    decl => {input => 'Azimuth : far-right',
             ast => {"property" => "azimuth",
                     "expr" => ["keyw" => "far-right"],
                     "_result" => "angle" => 60},
    },
    decl => {input => 'azimuth: center-left behind',  
             ast => {"property" => "azimuth",
                     "expr" => ["keyw" => "center-left", "behind" => "behind"],
                     "_result" => "angle" => 200},
    },
    decl => {input => 'AZIMUTH : Rightwards',
             ast => {"property" => "azimuth",
                     "expr" => ["rightwards" => "rightwards"],
                     "_result" => "delta" => 20},
    },
    decl => {input => 'azimuth: inherit',     ast => {property => 'azimuth', inherit => True},
    },
    decl => {input => 'background-attachment: FiXed',   ast => {property => 'background-attachment', expr => [keyw => 'fixed']},
    },
    decl => {input => 'Background-Attachment :inherit', ast => {property => 'background-attachment', inherit => True},
    },
    decl => {input => 'background-color : #37a', ast => {property => 'background-color', expr => [color => {r => 0x33, g => 0x77, b => 0xAA}]},
    },
    decl => {input => 'background-image : url(images/ok.png)', ast => {property => 'background-image', expr => [url => 'images/ok.png']},
    },
    decl => {input => 'background-repeat : Repeat-x', ast => {property => 'background-repeat', expr => [keyw => 'repeat-x']},
    },
    decl => {input => 'background-position : 100% 90%', ast => {"property" => "background-position", "expr" => [["percentage" => 100, "percentage" => 90]]},
    },
    decl => {input => 'border-collapse: separate',   ast => {property => 'border-collapse', expr => [keyw => 'separate']},
    },
    decl => {input => 'border-spacing: 3em',   ast => {property => 'border-spacing', expr => [length => 3]},
    },
    decl => {input => 'border-bottom:thick dotted red',
             ast => {"property" => "border-bottom",
                     "expr" => ["border-width" => ["keyw" => "thick"],
                                "border-style" => ["keyw" => "dotted"],
                                "border-color" => ["color" => {"r" => 255, "g" => 0, "b" => 0}]]},
    },
    decl => {input => 'border-collapse: collapse',     ast => {property => 'border-collapse', expr => [keyw => 'collapse']},
    },
    decl => {input => 'border-spacing: 2px .1cm',     ast => {property => 'border-spacing', expr => [length => 2, length => .1]},
    },
    decl => {input => 'border-right-color: green',     ast => {property => 'border-right-color', expr => [color => {r => 0, g => 128, b => 0}]},
    },
    decl => {input => 'border-bottom-style: outset',     ast => {property => 'border-bottom-style', expr => [keyw => 'outset']},
    },
    decl => {input => 'bottom: 5%',     ast => {property => 'bottom', expr => [percentage => 5]},
    },
    decl => {input => 'caption-side: top',     ast => {property => 'caption-side', expr => [keyw => 'top']},
    },
    decl => {input => 'clip: rect(5px, 40px, auto, 5px)',
             ast => {property => 'clip',
                     expr => ["shape" => {"top" => {"length" => 5},
                                          "right" => {"length" => 40},
                                          "bottom" => {"keyw" => "auto"},
                                          "left" => {"length" => 5}}]
             },
    },
    decl => {input => 'content: "Section " counter(Section) ". "',  
             ast => {"property" => "content",
                     "expr" => ["string" => "Section ",
                                "counter" => ["identifier" => "Section"],
                                "string" => ". "]},
    },
    decl => {input => 'counter-increment: section 10',
             ast => {"property" => "counter-increment",
                     "expr" => [identifier => "section", integer => 10]},
    },
    decl => {input => 'cue-before: url("quack.wav")',
             ast => {"property" => "cue-before",
                     "expr" => ["uri" => "quack.wav"]},
    },   
    decl => {input => 'cue-after: url("woof.wav")',
             ast => {"property" => "cue-after",
                     "expr" => ["uri" => "woof.wav"]},
    },   
    decl => {input => 'cue: none url("woof.wav")',
             ast => {"property" => "cue",
                     "expr" => ["cue-before" => ["keyw" => "none"],
                                "cue-after" => ["uri" => "woof.wav"]]},
    },   
    decl => {input => 'cursor: e-resize',     ast => {property => 'cursor', "expr" => [keyw => "e-resize"],},
    },
    decl => {input => 'direction:LTR',     ast => {property => 'direction', "expr" => [keyw => "ltr"],},
    },
    decl => {input => 'display: inline-table',     ast => {property => 'display', "expr" => [keyw => "inline-table"],},
    },
    decl => {input => 'elevation: 65DEG',     ast => {property => 'elevation', "expr" => ["angle" => 65], _result => angle => 65},
    },
    decl => {input => 'elevation:above',      ast => {property => 'elevation', "expr" => ["keyw" => "above"], _result => angle => 90},
    },
    decl => {input => 'elevation : LOWER',    ast => {property => 'elevation', "expr" => ["tilt" => "lower"], _result => delta => -10},
    },
    decl => {input => 'empty-cells: show',     ast => {property => 'empty-cells', "expr" => [keyw => "show"],},
    },
    decl => {input => 'margin:inherit',
             ast => {"property" => "margin", inherit => True},
    },
    decl => {input => 'max-width:30%',     ast => {property => 'max-width', "expr" => [percentage => "30"],},
    },
    decl => {input => 'orphans:3',     ast => {property => 'orphans', "expr" => [integer => 3],},
    },
    decl => {input => 'outline-color:olive',
             ast => {property => 'outline-color',
                     "expr" => ["color" => {"r" => 128, "g" => 128, "b" => 0}],},
    },
    decl => {input => 'outline-style:groove',     ast => {property => 'outline-style', "expr" => [keyw => "groove"],},
    },
    decl => {input => 'outline-width:2em',     ast => {property => 'outline-width', "expr" => [length => 2],},
    },
    decl => {input => 'outline:#00FF00 dotted thick',
             ast => {"property" => "outline",
                     "expr" => ["outline-color" => ["color" => {"r" => 0, "g" => 255, "b" => 0}],
                                "outline-style" => ["keyw" => "dotted"],
                                "outline-width" => ["keyw" => "thick"]]},
    },
    decl => {input => 'page-break-after:auto', ast => {"property" => "page-break-after",
                                                       "expr" => ["keyw" => "auto"]},
    },
    decl => {input => 'page-break-inside:avoid', ast => {"property" => "page-break-inside",
                                                       "expr" => ["keyw" => "avoid"]},
    },
    decl => {input => 'pause-before: 10s', ast => {"property" => "pause-before",
                                                   "expr" => ["time" => "10"]},
    },
    decl => {input => 'pause: 2s 5s', ast => {"property" => "pause",
                                              "expr" => ["pause-before" => ["time" => 2],
                                                         "pause-after" => ["time" => 5]]},
    },
    decl => {input => 'pitch-range: 10', ast => {"property" => "pitch-range",
                                                 "expr" => ["number" => "10"]},
    },
    decl => {input => 'play-during: url(test.wav) mix', ast => {"property" => "play-during",
                                                 "expr" => ["uri" => "test.wav", keyw => "mix"]},
    },
    decl => {input => 'quotes: "<" ">"', ast => {"property" => "quotes",
                                                 "expr" => [string => "<", string => ">"]},
    },
    decl => {input => 'richness: 10', ast => {"property" => "richness",
                                              "expr" => ["number" => "10"]},
    },
    decl => {input => 'right: 15%', ast => {"property" => "right",
                                            "expr" => ["percentage" => "15"]},
    },
    decl => {input => 'size:3ex', ast => {"property" => "size",
                                          "expr" => ["length" => 3]},
    },
    decl => {input => 'speak-header: always', ast => {"property" => "speak-header",
                                              "expr" => ["keyw" => "always"]},
    },
    decl => {input => 'speak-punctuation: code', ast => {"property" => "speak-punctuation",
                                                               "expr" => ["keyw" => "code"]},
    },
    decl => {input => 'speak: normal', ast => {"property" => "speak",
                                               "expr" => ["keyw" => "normal"]},
    },
    decl => {input => 'speech-rate: fast', ast => {"property" => "speech-rate",
                                                   "expr" => ["keyw" => "fast"]},
    },
    decl => {input => 'stress: 42', ast => {"property" => "stress",
                                            "expr" => ["number" => 42]},
    },
    decl => {input => 'table-layout: fixed', ast => {"property" => "table-layout",
                                                     "expr" => ["keyw" => "fixed"]},
    },
    decl => {input => 'unicode-bidi: embed', ast => {"property" => "unicode-bidi",
                                                     "expr" => ["keyw" => "embed"]},
    },
    decl => {input => 'visibility:hidden', ast => {"property" => "visibility",
                                                   "expr" => ["keyw" => "hidden"]},
    },
    decl => {input => 'voice-family: juliet, female',
             ast => {"property" => "voice-family",
                     "expr" => ["specific-voice" => ["identifier" => "juliet"],
                                "generic-voice" => ["keyw" => "female"]]},
    },
    decl => {input => 'VOLUME: LOUD', ast => {"property" => "volume",
                                              "expr" => ["keyw" => "loud"]},
    },
     decl => {input => 'widows: 3', ast => {"property" => "widows",
                                            "expr" => ["integer" => 3]},
    },
   ) {

    my $rule = $_.key;
    my %test = $_.value;
    my $input = %test<input>;

    $css_actions.reset;
     my $p = CSS::Language::CSS21.parse( $input, :rule($rule), :actions($css_actions));
    t::AST::parse_tests($input, $p, :rule($rule), :suite('css21'),
                         :warnings($css_actions.warnings),
                         :expected(%test) );
}

done;
