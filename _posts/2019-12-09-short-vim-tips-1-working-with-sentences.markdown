---
title: Short Vim Tips #1 - Working with sentences
published: false
series: Short Vim Tips
tags: vim
---
Did you know that Vim has some decent motions for working with sentences. I was reminded of this while doing some markdown editing in Vim earlier today. Here are the motions:

`(` - Delete sentences backwards
`)` - Delete sentences forwards

Combining those with a few common operations in Vim let's you work some editing magic:

`d(` - delete the sentence before your cursor
`d)` - delete the sentence after your cursor

`c(` - delete the sentence before your cursor
`c)` - delete the sentence after your cursor


I rediscovered these earlier today and hopefully they'll help you too. Until next time! 👋
