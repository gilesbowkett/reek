= reek

* http://rubyforge.org/projects/reek/
* mailto:kevin@rutherford-software.com

== DESCRIPTION:

Reek is a tool that examines Ruby classes, modules and methods and
reports any code smells it finds.

=== SUPPORTED CODE SMELLS:

* Long Method
* Large Class
* Feature Envy
* Uncommunicative Name
* Long Parameter List
* Utility Function
* Nested Iterators

== FEATURES/PROBLEMS:

* Most of the current checks are quite naive.
* Not many smells checked right now; more coming soon.
* The current Feature Envy check is probably over zealous.
* There's no convenient programmer's API just yet.

== SYNOPSIS:

  $ reek [options] [source_files]

(See `reek --help` for details.)

== REQUIREMENTS:

* ParseTree

== INSTALL:

Get the latest version of the gem:

    $ gem install reek

Or get the latest unpackaged source code:

    $ git clone git://github.com/kevinrutherford/reek.git

or

    $ git clone git://rubyforge.org/reek.git

== LICENSE:

(The MIT License)

Copyright (c) 2008 Kevin Rutherford, Rutherford Software Ltd

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
