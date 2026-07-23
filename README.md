# NumericalMethods
Effective implementations of standard numerical methods using GNU Octave.

> This repo was built by me for the Numerical Calculus class on UERJ-IPRJ

**Reference book: Numerical Analysis, by Burden and Faires**

## Building
The papers are avaliable as `.tex` source files (with a Makefile) under [analysis/](analysis/) to build:

``` shell
make PAPER=$METHOD # e.g bisection
```

The code for the implementations is avaliable under [methods/](methods/), you can run them with [GNU Octave](https://octave.org/) intalled in your system.

``` shell
octave $CATEGORY/$METHOD # e.g root_finding/bisection.m
```

## Method Listing:
### Root finding:
- [Bisection](methods/root_finding/bisection.m): Basically binary search for finding zeros of functions, it's slow, but it's reliable.
