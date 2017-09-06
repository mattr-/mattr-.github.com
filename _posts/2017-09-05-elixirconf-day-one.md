---
title: "ElixirConf 2017, Day One"
layout: post
---

This the second in a series of posts describing my experience
at ElixirConf 2017. Though it's not required, you can [read part one here](/2017/09/04/elixirconf-day-zero.html).

Today is day one for me and I attended the OTP Supervision Trees class today.
My brain has now melted with all the extra knowledge I was able to pick up. I
thought I knew plenty but I was wrong.

We covered the raw basics of process linking first, using functions like
`spawn_link/1`, `spawn_link/3`, `Process.link` and friends. Process monitoring was
next. I discovered `Process.monitor` and how to handle when links go
down.

Then we moved on to the first set of process primitives that I feel like most
people learn about first while learning Elixir and that's tasks. After tasks
was agents, after agents was GenServer, after GenServer were supervisors, and
finally applications.

Thanks to James Fish from Pinterest and Ben Marx from Bleacher Report for
teaching such a great workshop!

Tomorrow, I'll be in the Building GraphQL APIs with Absinthe session. GraphQL
is something I've had my eye for awhile. I'm really looking forward to it.
