Gloss Demo
==========

Just a demo application using the [Gloss] library. In the future I intend
for this to display a numerical simulation of a pendulum but for now it
is simply a rotating line.


Building
--------

You will need to have [Haskell] and [Cabal] installed on your system.

```bash
cabal sandbox init
cabal install -j
```


Running
-------

There is no configuration so the program can simply be run out of the
sandbox:

```bash
.cabal-sandbox/bin/gloss-demo
```


[Cabal]: https://www.haskell.org/cabal/
[Gloss]: https://hackage.haskell.org/package/gloss
[Haskell]: https://www.haskell.org/
