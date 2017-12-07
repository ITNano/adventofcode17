# adventofcode17
Herpa derp solutions for advent of code 2017. In haskell so probably kind of low standard of code. But it's more of a challenge like that.

## Using the tools (works with Haskell)
### Building and running
I am lazy. Hence I made a tool that generates my makefile. A make-maker so to say. To run it use `python makemaker.py [date]`. Then you can build and run the program with `make`. Note that this expects a few things though:
* Your input is in the base folder with the name day[day]\_input. For example day1\_input.
* The solution to your program is in the file day[day].hs. For example day1.hs.

### Handling of everyday input/output
I also added a module for reading input and executing the given solve functions. It is ugly (so don't look at it too closely) but the way it works is essentially that you import the module `Util` and calls on the `runMain` function. An example of this could be `runMain day1 puzzle1Solver puzzle2Solver`. As long as you provide the solve functions it will do the printing and reading files and stuffs for you. Laziness is awesome.

## Disclaimer
The code produced for this are not examples of good code. Please use a blur filter. But I'm slowly learning. Just you wait, just you wait.
