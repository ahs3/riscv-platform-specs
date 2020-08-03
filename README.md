# RISC-V Operating System Platform Specification

## Copyright and License Information

This RISC-V Operating System Platform Specification is

- (C) 2017 Krste Asanovic <krste@sifive.com>
- (C) 2017-2019 Palmer Dabbelt <palmer@sifive.com>
- (C) 2017 Andrew Waterman <andrew@sifive.com>
- (C) 2020 Al Stone <ahs3@redhat.com>

It is licensed under the [Creative Commons Attribution 4.0 International
License (CC-BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

## Contributors

These individuals either wrote portions of this specification or contributed
ideas and suggestions in some way:

- Krste Asanovic <krste@sifive.com>
- Palmer Dabbelt <palmer@sifive.com>
- Atish Patra <atish.patra@wdc.com>
- Al Stone <ahs3@redhat.com>
- Andrew Waterman <andrew@sifive.com>

## Introductions

This document is the RISC-V Operating System Platform Specification
(OSPS).  This specification defines the hardware and firmware
required to be able to install and use a general purpose
operating system on a platform built around the RISC-V
Instruction Set Architecture (ISA).  In particular, the intent
is to set out the constraits necessary for a hardware platform
that can be used by multiple operating systems.

Further, this specification sets out the constraints on the
RISCV-V Instruction Set Architecture (ISA) -- at all privilege 
levels -- that are needed to provide a consistent and predictable
environment for running these operating systems.

## Contents
This project contains two specific components:

- A TODO list for all the subjects to be discussed and/or added to
the specification.
- The OSPS specification in asciidoc format; this is comprised of
multiple files, the starting point being `riscv-osps.adoc`.

## More Human-Readable Forms
The main format for the OSPS and the TODO list is asciidoc.  There is
a `Makefile` provided that will build markdown, HTML and PDF forms of the
specification.

To build these other formats, first install the right packages.  For
Fedora systems, use this:
```
    $ make install-rpms
```
For Debian systems, use:
```
    $ make install-debs
```
You will need `sudo` access to install packages.

To build everything, use:
```
    $ make
```
You can clean up the mess with:
```
    $ make clean
```
