---
title: "Porting Atom Packages - Part Two: Removing Deprecation Warnings"
layout: post
---

**Intro**

I'm a long time Vim user and have been playing with Atom in my spare time. One of the features that I liked about Tim Pope's vim-rails plugin is the file navigation. There's a couple of plugins for Atom that will do this, but sadly, none of them appear to have been updated for the Atom 1.0 API. So, I decided to fix that, and document the process here, just in case anybody else can benefit from this. For these blog posts, I'll be updating the [rails-navigation plugin](https://atom.io/packages/rails-navigation). I'm also assuming that you're on either OS X or Linux while working through these posts. Let's keep going!

If you haven't yet read it and you're new to Atom package development, I think you would benefit [from reading part one](http://mattr.info/2015/08/05/porting-atom-packages-part-one-getting-set-up.html)


## Step One: Fix the Stylesheet locations

The first warning we'll tackle from the deprecation warning list is the warning about the stylesheet location:

<a href="/public/images/porting-atom-packages-part-two-stylesheet-warnings.png">
<img src="/public/images/porting-atom-packages-part-two-stylesheet-warnings.png" class="atom-image-thumbnail">
</a>

Atom 1.0 moves the styles from the the `stylesheets` folder in the package to the `styles` directory. We'll follow suit in the package and a simple `git mv stylesheets styles` does the trick for that deprecation warning. At the same time, we've removed the comment and the import of `ui-variables` from the top of `rails.less` since that's a pattern that no longer applies when creating stylesheets for Atom plugins

## Step Two: Fix the Keymap

The second warning we'll fix is the one about deprecated selectors being used in the keymap:

<a href="/public/images/porting-atom-packages-part-two-keymap-deprecations.png">
<img src="/public/images/porting-atom-packages-part-two-keymap-deprecations.png" class="atom-image-thumbnail">
</a>

Similar to the last error, we just need to make a few text updates. One search and replace in the `keymap.cson` file in the package to change `.editor` to `.atom-text-editor` and another one to replace `workspace` with `atom-workspace` and this deprecation warning is eliminated as well.


## Step Three: Fix the package activation events

The third warning we'll fix is about what triggers the activation of the package. Atom delays activation of a package until a set of events specified by the package developer are triggered. Before Atom 1.0, the key for this in the `package.json` file was `activationEvents`. Now it's `activationCommands` and the format has changed slightly.

<a href="/public/images/porting-atom-packages-part-two-activation-deprecations.png">
<img src="/public/images/porting-atom-packages-part-two-activation-deprecations.png" class="atom-image-thumbnail">
</a>

All the events for the `rails-navigation` package are editor events, meaning that we can keep the same array of events and just nest them in the `atom-text-editor` selector:

```
"activationCommands": {
  "atom-text-editor": [ "rails:go-to-model",
                        "rails:go-to-controller",
                        "rails:go-to-helper",
                        "rails:go-to-migration",
                        "rails:go-to-view"
                      ]
}
```

After that update, we're down to one more deprecation warning to remove

## Step Four: Updating the context menu

Last, but certainly not least, we need to update the context menu format. The format appears to have completely changed over to be more consistent with other places in the application and it's also more explicit.

<a href="/public/images/porting-atom-packages-part-two-context-menu-deprecations.png">
<img src="/public/images/porting-atom-packages-part-two-context-menu-deprecations.png" class="atom-image-thumbnail">
</a>

Fortunately, `rails-navigation` only has one menu item, so the change was pretty simple and the new context menu CSON looks like this:

```
'context-menu':
  'atom-text-editor': [
    {
      'label': 'Enable rails'
      'command': 'rails:toggle'
    }
  ]
```

## Outro

We've gotten the deprecation warnings that Atom tells us about when we load up our package removed. The complete set of changes in this post have been pushed to [my fork on GitHub](https://github.com/strikingcode/rails-navigation/compare/master...mattr-:fix-deprecation-warnings) if you want to take a look. Thanks for reading! See you next time!
