---
title: "Porting Atom Packages - Part One: Getting Things Set Up"
layout: post
---

**Intro**

I'm a long time Vim user and have been playing with Atom in my spare time. One of the features that I liked about Tim Pope's vim-rails plugin is the file navigation. There's a couple of plugins for Atom that will do this, but sadly, none of them appear to have been updated for the Atom 1.0 API. So, I decided to fix that, and document the process here, just in case anybody else can benefit from this. For these blog posts, I'll be updating the [rails-navigation plugin](https://atom.io/packages/rails-navigation). I'm also assuming that you're on either OS X or Linux while working through these posts. Let's get started!

**Get the code**

I forked [strikingcode/rails-navigation](https://github.com/strikingcode/rails-navigation) to [mattr-/rails-navigation](https://github.com/mattr-/rails-navigation) and cloned it to my laptop to work on it. One step down. Several to go.

**Using the local version of the package**

The Atom docs suggest using the package generator to generate a package for you and start from there. Since we've got an existing package, that method won't work for us. However, getting our newly cloned package loading into Atom is still pretty straightforward. Atom loads any package that's in `$HOME/.atom/packages` on startup, which means that we can symlink our local codebase into `$HOME/.atom/packages` and Atom will load it for us. :tada:

**Seeing where we're at**

The final step for part one of this guide is to figure out what issues we're facing with the package. Under `View -> Developer`, there's a menu item `Open in Dev Mode...`. Since I've been writing this post in Atom, I chose to use this option to give me an Atom window that's in dev mode so that I don't mess with the window that I'm using to get real work done. :smiley:

Next thing is to run some specs. Sadly, the first time I did this, they failed to run because I failed to account for the dependencies that this package has on packages in NPM. A simple `npm install` in the package directory and the specs are all running again. However, they fail due to the removal of deprecated classes, so we'll be taking care of that soon.

**Outro**

Now that we have thing set up, and we've gotten the specs run and our dependency issues worked out, let's take a short break, and then we'll get to fixing those deprecations the deprecation cop told us about.
