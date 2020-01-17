use v6.c;
unit class Math::SelfDescriptiveNumbers:ver<0.0.1>:auth<cpan:HOLLI>;


multi sub is-self-descriptive( Int $number, Int $base ) is export {
    is-self-descriptive( :$number, :$base );
}

multi sub is-self-descriptive( Int :$number, Int :$base ) is export {
    $number.base( $base ) (elem) self-descriptive-numbers-of( $base );
}

multi sub is-self-descriptive( Str $number, Int $base ) is export {
    is-self-descriptive( :$number, :$base );
}

multi sub is-self-descriptive( Str :$number, Int :$base ) is export {
    $number (elem) self-descriptive-numbers-of( $base );
}

sub self-descriptive-numbers is export {
    ( 1 .. 36 ).map( -> $base { ( $base, self-descriptive-numbers-of( $base ) ) });
}

sub self-descriptive-numbers-dec is export {
    ( 1 .. 36 ).map( -> $base { ( $base, self-descriptive-numbers-of( $base ).map({ parse-base($_, $base ) }) ) });
}

multi sub self-descriptive-numbers-of( Int $base where $_ ~~ 1|2|3|6 ) is export { () }
multi sub self-descriptive-numbers-of( Int $base where $_ == 4 ) is export { ('1210', '2020') }
multi sub self-descriptive-numbers-of( Int $base where $_ == 5 ) is export { ('21200') }
multi sub self-descriptive-numbers-of( Int $base ) is export { 
    ( ($base - 4).base( $base ) ~  "21" ~ ( '0' x ($base - 7) ) ~ '1000' )
}


=begin pod

=head1 NAME

Math::SelfDescriptiveNumbers - Calculates self-descriptive numbers

=head1 SYNOPSIS

=begin code :lang<perl6>

use Math::SelfDescriptiveNumbers;

for self-descriptive-numbers() -> ($base, $numbers) {
    "Base $base, " ~ ( $numbers.elems ?? $numbers.join(',') !! '---' );
}

for self-descriptive-numbers-dec() -> ($base, $numbers) {
    "Base 10, " ~ ( $numbers.elems ?? $numbers.join(',') !! '---' );
}

say "Yes"
    if is-self-descriptive( '21200', 5 );

say "This too"
    if is-self-descriptive( :number('21200'), :base(5) );
    
say "So is this"
    if is-self-descriptive( 0xC210000000001000, 16 );


=end code

=head1 DESCRIPTION

Calculates self-descriptive numbers for a given base, up to 36. This is part of the L<https://perlweeklychallenge.org/blog/perl-weekly-challenge-043/|weekly challenge>. 

=head1 AUTHOR

holli-holzer <holli.holzer@gmail.com>

=head1 COPYRIGHT AND LICENSE

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
