Solutions to EoPL3 Exercises
============================

:Author: Cheng Lian <lian.cs.zju@gmail.com>

########
Contents
########

.. toctree::
    :maxdepth: 1
    :glob:

    ./*

########
Overview
########

This documentation is my (WIP) solutions to `Essentials of Programming Languages 3rd edition`__ exercises. All the source code can be found on `GitHub`__.

The Scheme code is written using the ``eopl`` dialect provided by DrRacket 6.4. Please refer to `the official DrRacket documentation`__ for more details. Most code snippets are tested using ``rackunit`` (`doc`__). Each source file is a complete Racket program, although sometimes only the interesting parts in the file are shown in the HTML page.

To run the code, first install Racket 6.4+, then install the ``eopl`` package::

    $ raco pkg install eopl

After installing the ``eopl`` package, running the scheme code should be as easy as::

    $ racket <file-path>

__ http://www.eopl3.com/
__ http://github.com/liancheng/eopl3/
__ http://docs.racket-lang.org/eopl/
__ http://docs.racket-lang.org/rackunit/
