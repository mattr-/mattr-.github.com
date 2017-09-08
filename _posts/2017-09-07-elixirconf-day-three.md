---
title: "ElixirConf 2017, Day Three"
layout: post
---

This the fourth in a series of posts describing my experience
at ElixirConf 2017. Though it's not required, you can read the prior posts

* [Part one](/2017/09/04/elixirconf-day-zero.html)
* [Part two](/2017/09/05/elixirconf-day-one.html)
* [Part three](/2017/09/06/elixirconf-day-two.html)

Today is day three for me and today is the day the conference itself started!

**TL;DR?** There were lots of great talks and there will be more tomorrow. :smiley:

## Keynote

Justin Schneck did an amazing talk with a live demo to build a photobooth app
with Elixir and Nerves. It was fascinating to see the growth and progress of
the Elixir community over the past year and with that the growth in the Nerves
project specifically. The nerves project has put a fantastic project together.
I wasn't super excited about working with hardware before but being able to
work with Elixir and hardware at the same time has me thinking about various
hardware projects again.

## The Alchemist Gopher: My Journey from Go to Elixir

Veronica Lopez spoke about how she discovered Elixir and compared it to Go and
where it makes sense to use both things. My biggest take away from this talk
was that there's no reason why we can't have Elixir and Go in the same app and
we should be thinking about how we can use the two languages in compliment to
each other vs. pitting one against the other.

## Thinking in Ecto

Darin Wilson gave an absolutely amazing introductory talk on the things you
need to know to start using Ecto quickly and efficiently. As someone who's not
done a whole lot with Ecto yet, I love how much more approachable being at
this talk made Ecto for me.

## Phoenix after 100,000 lines

This talk was everything I was hoping for, describing what happens when you
take a new but burgeoning language and ecosystem and use it for your startup.

## Working with legacy databases in Ecto

This talk was amazing for dealing with all those little details that pop up
when it comes to handling databases that don't fit into Ecto's defaults.

## Editor in Elixir

Ian Duggan walked us through the work he's been doing on a text editor in
Elixir. It covered his work on getting an implementation of ropes in Elixir,
working with the terminal, and getting a GUI going with WxWidgets.

## Streaming Video with Elixir

This was a great example of using GenStage to call out to ffmpeg to transcode
a video that was being interacted with via buttons on the presentation to
update a set of `yay` and `nay` counts live on the video.

## Lightning Talks

Lots of interesting talks here. The first one was done over Hangouts from
India! Here's a summary of the talks that I could catch. I admit to missing
some because I was hungry and went to grab dinner towards the end:
 * a QR code generation app in the terminal. This was super awesome because
you could hold up the QR scanner on your phone and scan the projector screen
and have it work.
 * An Elixir success story decomposing a giant C++ based NLP monolith
 * A talk about all the little things in Elixir that we may or may not have known about before.
 * A demo of Thesis, a CMS for Phoenix apps written by the folks at InfiniteRed.
 * Mocking and Explicit Contracts via the `elixir_mock` package
 * Elixir and OpenAPI. TIL that Google is generating Elixir client libraries for their APIs
 * How to convince your boss to endorse Elixir and OTP and let you write more Elixir at work.
 * An overview of XProf for profiling your Elixir code.
 * Using LISP for as much as your front-end as possible - in this case, ClojureScript.
 * Using typespecs for better code and better documentation
 * Bootleg for simple deployment and server automation for Elixir




