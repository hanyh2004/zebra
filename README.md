Zoin integration/staging tree
=============================

What is Zoin?
-------------

Zoin is the implementation of the Zerocoin protocol ( http://zerocoin.org ) guaranteeing true financial anonymity.

 - 2.5 minute block target
 - 21 million total coins
 - 100 coins per block as subsidy
 - Subsidy halves every 105000 blocks (approximately 6 months)
 - Tail subsidy of 10 coins per block after 2 years (~10% per year)

For more information, as well as an immediately useable, binary version of
the zoin client sofware, see https://github.com/zoincoin/zoin/releases.

License
-------

Zoin is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.

Development process
-------------------

Developers work in their own trees, then submit pull requests when they think
their feature or bug fix is ready.

If it is a simple/trivial/non-controversial change, then one of the zoin
development team members simply pulls it.

The patch will be accepted if there is broad consensus that it is a good thing.
Developers should expect to rework and resubmit patches if the code doesn't
match the project's coding conventions (see `doc/coding.txt`) or are
controversial.

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/zoincoin/zoin/tags) are created
regularly to indicate new official, stable release versions of Zoin.

Testing
-------

### Automated Testing

Developers are strongly encouraged to write unit tests for new code, and to
submit new unit tests for old code.

Unit tests for the core code are in `src/test/`. To compile and run them:

    cd src; make -f makefile.unix test

Unit tests for the GUI code are in `src/qt/test/`. To compile and run them:

    qmake BITCOIN_QT_TEST=1 -o Makefile.test zoin.pro
    make -f Makefile.test
    ./zoin-qt_test

Installation
------------

Please see details in Wiki section

Copyright
---------

Copyright (c) 2017 ZoinCoin Team
Copyright (c) 2016 Zoin Developers
Copyright (c) 2016 ZCoin Developers
Copyright (c) 2011-2014 Zerocoin Developers
Copyright (c) 2009-2014 Bitcoin Developers
