[![Build Status](https://travis-ci.org/holli-holzer/raku-Math-SelfDescriptiveNumbers.svg?branch=master)](https://travis-ci.org/holli-holzer/raku-Math-SelfDescriptiveNumbers)

NAME
====

Math::SelfDescriptiveNumbers - Calculates self-descriptive numbers

SYNOPSIS
========

```perl6
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
```

DESCRIPTION
===========

Calculates self-descriptive numbers for a given base, up to 36. This is part of the [weekly challenge](https://perlweeklychallenge.org/blog/perl-weekly-challenge-043/). 

AUTHOR
======

holli-holzer <holli.holzer@gmail.com>

COPYRIGHT AND LICENSE
=====================

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

