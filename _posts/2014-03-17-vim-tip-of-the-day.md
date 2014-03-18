---
layout: post
title: Vim Tip of the Day
---

{{ page.title }}

## Use `Ctrl+R` to paste things from registers into the command line.

I use the fugitive plugin to deal with Git on a daily basis and I had
recently run into several instances where I needed to delete files that
were showing up in the output of `git status`. Normally, I would use OS
X's copy and paste to handle this, but the other day I finally got fed
up and looked for a different way.

Enter `Ctrl+R`. Since I was typing on Vim's command line, I went
skimming through the help (`:help cmdline-editing`) where I found what I
was looking for: The ability to copy and paste from Vim registers into
the command line.

So, if you need to copy and paste in Vim either on the command line you
can do it with `Ctrl+R` and then the register name.  For example, if you
copy some paste using `y$` (copy from the current cursor position to the
end of the line), you can then paste it in the command line or in insert
mode by typing `Ctrl+R` followed by `"`. Any other valid registers you
may have text in can be used in place of `"`.

Earlier today, I also found out that `Ctrl+R` also works this way in
insert mode as well, thanks to [this
answer](http://stackoverflow.com/revisions/2960630/5)
from [this
question](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim) on StackOverflow.




