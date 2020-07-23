From Ruby Random Numbers:

If you needed a random integer to simulate a roll of a six-sided die, you'd use: 1 + rand(6). A roll in craps could be simulated with 2 + rand(6) + rand(6).

Finally, if you just need a random float, just call rand with no arguments.

As Marc-André Lafortune mentions in his answer below (go upvote it), Ruby 1.9.2 has its own Random class (that Marc-André himself helped to debug, hence the 1.9.2 target for that feature).

For instance, in this game where you need to guess 10 numbers, you can initialize them with:

10.times.map{ 20 + Random.rand(11) } 
#=> [26, 26, 22, 20, 30, 26, 23, 23, 25, 22]
Note:

Using Random.new.rand(20..30) (using Random.new) generally would not be a good idea, as explained in detail (again) by Marc-André Lafortune, in his answer (again).

But if you don't use Random.new, then the class method rand only takes a max value, not a Range, as banister (energetically) points out in the comment (and as documented in the docs for Random). Only the instance method can take a Range, as illustrated by generate a random number with 7 digits.

This is why the equivalent of Random.new.rand(20..30) would be 20 + Random.rand(11), since Random.rand(int) returns “a random integer greater than or equal to zero and less than the argument.” 20..30 includes 30, I need to come up with a random number between 0 and 11, excluding 11.
