---
layout: post
title: Pair Programming with Katrina Owen
---
## {{ page.title }}

On Thursday, April 25th, I was fortunate enough to be able to spend a
couple of hours pairing with [Katrina Owen](http://github.com/kytrinyx)
on a refactoring for [Tracks](http://getontracks.org). Here's a brief
retrospective on that session.

I've read various places online that pair programming is more draining
mentally than when you're just working by yourself. I didn't spend the
whole day pairing but that certainly wasn't the case here. I cannot say
enough good things about the session. I haven't had that much fun coding
on something in a long time and I'm so so happy with how the code that
we were working on turned out. I also left that session with a ton of
new energy for crafting software.

This was my first remote pairing session. Here are some of the things I
liked about it:

 - I had the box set up before hand. Vim, shell, tmux (mostly), the code
   we were going to work on, all done before the pairing session
   started.
 - I picked something small to work on. All we did as part of this
   session was extract a single method.

The things I didn't like:

 - The box was slow. We were only running two tests out of the test
   suite. They took 20 seconds to run. Normally, I spoil myself on a
   Retina Macbook Pro which takes 20 seconds to run the whole test
   suite. We spent a ton of time running the tests.
 - I had more planned that we didn't get to. Now, this isn't really a
   bad thing, I was just hoping that it wouldn't take as long as it did
   to extract that method.

And some stuff I learned:

 - If you're going to extract a method and want to see what will be
   affected by your method extraction, raise an exception at the
   beginning of the method and run your full test suite. That will catch
   all the places the method is called in your tests, which you can use
   for the next step
 - Take the information from the previous step and create a rake task to
   only run the tests that are affected by the code you're changing.
   Then set up a shortcut in your editor so you can run thoses tests as
   often as you need to.
 - The faster the test suite, the more fun you'll have.

To sum it all up, the more you pair with others, the more fun you'll
have coding, the more you'll learn, and the better your code will be. I
simply cannot recommend it enough. Thanks to Katrina for taking some
time out of her busy schedule for a pairing session!

