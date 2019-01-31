Gcode-ParseSpeed version 0.01

This is not a usable module. It's purpose is to explore the speed of different
techniques for parsing/recognizing large numbers of short strings.

## ABSTRACT

I was working on a tool for manipulating gcode files in a standardized way. Over
time I have written a number of short scripts that make changes to gcode files
used in 3D printing. There comes a point when you have to consider generalizing
these tools to simplify making new scripts.

While working on the generalized tool, I started to wonder whether the approach
I was using for recognizing and parsing particular lines would have a significant
impact on the speed of the tool. This project was born from that question.

## OBSERVATIONS

This is not a really scientific study with all of the variable accounted for. It
is more of an exploration of ideas.

I have heard many people claim that you should replace regular expressions with
`index` and `substr`, if you really want speed. While this might be true in C,
the tests did not support that in Perl. More interestingly, even complicated
regexes that were close to the speed of `index` and `substr` were so much easier
to get right and to read, that the speed benefit is dubious.

Although I probably should not have been, I was surprised to find that non-greedy
matches were slower than their greedy counterparts. Since the penalty for a greedy
match is mostly when it has to backtrack a long way, that makes sense once you
think about it. (None of the lines we match in these tests are very long.)

Overall, it seems that the obvious regex approaches were plenty fast for the
problem I am trying to solve. Moreover, none of the other approaches I tried
showed enough benefits to be worth the extra work. Given this is the approach
used for years by grep and it's descendants, that's not a real surprise.

One final note: I know someone is going to declare that this is a complete
waste of time, because everyone knows I should have used a *real parser*. I
only got a small distance into testing parsers and found that they were
much, much slower at solving this problem. If I were performing a parse of
the entire file, the multiple levels of work that a real parser does would
be worthwhile. Not in this case.

## SCRIPTS

I created a number of scripts that simulate different problems that I might want
to solve. For each of these scripts, I implemented the parsing multiple ways.
Each script is a benchmark program that compares the different approaches for
solving that particular problem.

* bm-double_zmove: Trigger at the first move of the Z axis to something around 2mm and again about 3mm.
   - More complicated match looking for particular zmoves
   - Testing including state to only trigger once near certain mm boundaries
   - 2 matches for any file.
* bm-G1: Trigger at each move of the Z axis between 2 and 3 mm.
   - More complicated match looking for particular zmoves
   - Triggers once per layer between 2 and 3 mm.
   - Depending on the slicing layer height: 3-5 matches.
* bm-zero_extruder: Trigger each time we zero the extruder length.
   - Simple match
   - Likely a large number of matches
* bm-zmove: Trigger each time we move in the z axis.
   - Triggers once per layer
   - Likely a large number of matches

## TARGETS

There are a number of files in the target directory that have been sliced using
the slic3r program. The actual parameters of the slicing are less important than
the fact that they are gcode files. The length of the files probably has the
biggest impact on the test, because it determines how many times we try to parse.

1. cal_shapes-0_5.gcode
   - Fairly simple model I made in OpenSCAD for testing printer calibration.
2. loubie_adalinda_dragon.gcode
   - [Loubie's Adalinda: The Singing Serpent](https://www.thingiverse.com/thing:246198)
   - Licensed under a Creative Commons - Attribution - Non-Commercial license
   - Complicated model that is reasonably large.
3. one_layer.gcode
   - A really simple model I made for a single layer cuboid.
4. rose.gcode
   - The rose model is one of my own design.
5. travel_caddy.gcode
   - The travel caddy model is one of my own design.

I hold the copyright on all of the models, except Loubie's Adalinda.

## RUNNING

To install this module, run the following commands:

	perl Makefile.PL
	make
	make test

## RESULTS

The results of my most recent run of the code can be found in the `results` directory.

## DEPENDENCIES

None.

## COPYRIGHT AND LICENCE

Copyright (C) 2018, G. Wade Johnson

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
