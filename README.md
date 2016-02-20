# JSTime

This is a different approach to Javascript time than Moment.js. Inspired by Groovy's TimeCategory, this kinda cheats and
resorts to just parsing strings. BUT the goal is to create a time library that is flexible with a very English-like DSL.

## What am I talking about?

This is what it looks like:

time("1 day and 1 week ago")
Thu Feb 11 2016 22:54:00 GMT-0500 (EST)
time("1 minute from now")
Fri Feb 19 2016 22:55:02 GMT-0500 (EST)
time("2 weeks before 2 days after 6 weeks ago")
Sun Dec 27 2015 22:54:14 GMT-0500 (EST)
time("2 days after 6 weeks ago")
Sun Jan 10 2016 22:54:20 GMT-0500 (EST)
time("6 weeks ago")
Fri Jan 08 2016 22:54:23 GMT-0500 (EST)
time("1 minute ago")
Fri Feb 19 2016 22:53:33 GMT-0500 (EST)

Currently only supports times up to a week. Once you get into months and years, things require a little more calculation.
That can probably be addressed by depending on a good time library like moment to take care of the actual work, and just
wrapping it in my DSL.

## How did you do that?

I used a Javascript library called PEG.js that turns a parser grammar into a parser. Just write up the grammar for your strings,
and  you can parse anything. ;)