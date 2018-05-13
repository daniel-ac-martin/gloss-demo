Gloss Demo
==========

Just a demo application using the [Gloss] library that displays a crude
simulation of a single, undamped pendulum.

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
