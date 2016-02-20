/**
 *  Time Phrase Grammar.
 *  Parses phrases like "1 year ago"
 *  Or more complex like "20 years and 5 seconds before January 10th"
 */

{
    var SECOND = 1000;
    var MINUTE = 60 * SECOND;
    var HOUR = 60 * MINUTE;
    var DAY = 24 * HOUR;
    var WEEK = 7 * DAY;

    function now() { return new Date(); }
}


start
 = Date

Date
 = quantity:QuantityExpression _ relative:RelativePart {
        return new Date(relative.to.getTime() + relative.direction*quantity);
 }
 / quantity:QuantityExpression { return new Date(quantity); }
 / "now" { return now(); }
 / "yesterday" { return new Date(now().getTime() - DAY); }
 / "tomorrow" { return new Date(now().getTime() + DAY); }

RelativePart
 = direction:Relative _ to:Date? {
    return { direction: direction, to: to ? to : now() };
 }

QuantityExpression
 = item:QuantityItem _ "and" _ quantity:QuantityExpression {
    return item + quantity;
 }
 / QuantityItem

QuantityItem
 = quantity:Number _ unit:TimeUnit  {
        return quantity * unit;
 }

Number
 = [0-9]+

TimeUnit
 = (Second / Minute / Hour / Day / Week)

Second
 = ("seconds"/"second") { return SECOND; }

Minute
 = ("minutes"/"minute") { return MINUTE; }

Hour
 = ("hours" / "hour") { return HOUR; }

Day
 = ("days" / "day") { return DAY; }

Week
 = ("weeks" / "week") { return WEEK; }

Relative
 = (Positive / Negative)

Positive
 = ("from"/"after"/"next") { return 1 }

Negative
 = ("before"/"ago"/"last") { return -1 }

_ "whitespace"
  = [ \t\n\r]*