---
layout: post
title: Find Your Failing Tests
---

# {{ page.title }}

When I start on a extract method refactoring, my normal trick is to
`raise` in the method that I'm looking to extract. I then find all the
test files that failed and stick them in a `wip` rake task.  I can't claim
any credit for this particular method of doing things though. Both of
those tricks came from [a pairing session I had with Katrina Owen](/2013/04/28/pairing-katrina-owen-recap.html).

Previously, most of my refactoring work on
[Tracks](http://getontracks.org) was focused on smaller sections of the
code and I hadn't hit any large cross cutting concerns yet. This meant
that I could just scan the test failures for the files in question,
since they were rarely larger than a page or two.

The last refactoring I did, along with the current refactoring I'm
working on, cut across various concerns and spew errors all across the
test suite. Scanning was not going to work anymore. So I put together a
quick shell command to find the failing test files for me:

```
rake test | grep ' test/' | cut -d':' -f1 | sort | uniq
```

This does the following:

1. Runs the tests
2. Looks for files that live in the `test` directory. The extra space
   was just to make sure I grabbed only the test files, since they're
   indented by spaces in the Rake output.
3. Grabs the filename of the test. The test runner puts a colon between
   the filename and the line number, so we can split on that easily.
4. Sorts the files
5. Makes the list of files unique

At this point, I have a nice list of files with failing tests to plug in
to my `wip` rake task and don't have to run my whole test suite while I
refactor. Enjoy!
