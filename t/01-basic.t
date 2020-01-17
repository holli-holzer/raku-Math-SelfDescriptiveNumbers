use v6.c;
use Test;
use Math::SelfDescriptiveNumbers;
plan 5;
ok is-self-descriptive( :number(parse-base('21200',5)), :base(5) );
ok is-self-descriptive( :number('21200'), :base(5) );
ok is-self-descriptive( 'C210000000001000', 16 );
ok is-self-descriptive( 0xC210000000001000, 16 );
ok !is-self-descriptive( 3210001000, 10 );
