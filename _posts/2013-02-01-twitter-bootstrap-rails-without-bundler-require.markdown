---
layout: post
title: 'Using twitter-bootstrap-rails without Bundler.require'
---

# {{ page.title }}

Myron Marston recently wrote a post recommending [the removal of
Bundler.require](http://myronmars.to/n/dev-blog/2012/12/5-reasons-to-avoid-bundler-require).
Go read his post. Go ahead. I'll wait.

I didn't find anybody on Google with my same problem, so I'm documenting
it here for posterity. (And to partly remind my future self how much of
a dumb Rails noob I was when I wrote this post).

## The Problem

Removing `Bundler.require` from `config/application.rb` explicitly
disables part of Rails' autoloading mechanism. Which means your asset
gems don't get autoloaded, which means you get all sorts of weird errors
in your application log, like so:

    ActionView::Template::Error ('twitter/bootstrap/bootstrap.less'
    wasn't found. (in
    /Users/matt/Code/my_test_app/app/assets/stylesheets/bootstrap_and_overrides.css.less)):

And then you pull your hair out googling, and searching on stack
overflow for the solution, because surely, in the 2 months since Myron's
post was published, somebody has run into this, right? RIGHT? No, they
haven't, or they're smarter than me and figured it out on their own.

## What the hell do I do now?

I spent what I thought was an exorbitant amount of time trying to figure
out why this wasn't working, what was actually going on, and how to fix
it.

The first clue is just before the conclusion of Myron's post:

>Many gems provide rake tasks. If the gem is no longer being loaded at
>environment boot time, these tasks may not be available. Ripple, for
>example, provides a handful of rake tasks. To make these tasks
>available in your application, you’ll need to add load
>"ripple/railties/ripple.rake" to your Rakefile, which is essentially
>what the rake_tasks block in Ripple’s railtie does.

The second clue came when I was looking in `config/application.rb` which
is where the `require` statements for a bunch of railties live.

## The solution

The solution is actually really simple. Add

    require "less/rails/railstie"
    require "twitter-bootstrap-rails"

to `config/application.rb` and suddenly the error about not behind able
to find that bootstrap.less file I mentioned above just disappears.

## But wait, there's more!

I ended up getting a similar error with jQuery. 

    ActionView::Template::Error (couldn't find file 'jquery' (in
    /Users/matt/Code/my_test_app/app/assets/javascripts/application.js:13)):

Ok, we've been here before. This is simple now. Add

    require "jquery-rails"

to `config/application.rb` and now I am greeted by the empty view I put
in place for my default route.
