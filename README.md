# JSTime

This is a different approach to Javascript time than [Moment.js](http://momentjs.com/). It is inspired by [Groovy's TimeCategory](http://docs.groovy-lang.org/latest/html/api/groovy/time/TimeCategory.html). However, Javascript makes it hard to do straight properties as methods (at least until ES6), so the closest you can get to the Groovy approach is something like [Date.js](http://www.datejs.com/), which I feel mostly defeats the purpose of not using moment as-is. This library decides to take a bit of a different approach. It's almost cheating, as we just parse strings rather than trying to actually build features into the language. But the goal is to make date manipulation more readable and reliable than current approaches. This library is a start to achieving a domain specific language that is very English-like and very flexible, and I think the string parsing does a much better job at it than anything else.

## What am I talking about?

This is what it looks like:

```
> time("1 day and 1 week ago")
Thu Feb 11 2016 22:54:00 GMT-0500 (EST)
> time("1 minute from now")
Fri Feb 19 2016 22:55:02 GMT-0500 (EST)
> time("2 weeks before 2 days after 6 weeks ago")
Sun Dec 27 2015 22:54:14 GMT-0500 (EST)
> time("2 days after 6 weeks ago")
Sun Jan 10 2016 22:54:20 GMT-0500 (EST)
> time("6 weeks ago")
Fri Jan 08 2016 22:54:23 GMT-0500 (EST)
> time("1 minute ago")
Fri Feb 19 2016 22:53:33 GMT-0500 (EST)
```

Currently only supports times up to a week. Once you get into months and years, things require a little more calculation.
That can probably be addressed by depending on a good time library like moment to take care of the actual work, and just
wrapping it in my DSL.

## How did you do that?

I used a Javascript library called PEG.js that turns a parser grammar into a parser. Just write up the grammar for your strings,
and  you can parse anything. ;)

## Live Demo
[Here](http://ryanheathcote.com/js-human-time/)

## Working with it
If you want to work with it, for now it's really dumb because I haven't tried to do gulp with file watching -- you have to 
generate the parser after every change.

* Install peg.js: `$ sudo npm install -g pegjs`
* Run the generator: `$ pegjs -e "timeParser" time.pegjs peg_time.js`
