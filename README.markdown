Readable string for coupon codes or auth tokens, something people can read/write and do not confuse.

 - more information density than hex -> shorter codes
 - less confusion than base64 -> readable codes

Install
=======
 - As Rails plugin: ` script/plugin install git://github.com/grosser/readable_random.git `
 - As gem: ` sudo gem install grosser-readable_random --source http://gems.github.com `

Usage
=====
    ReadableRandom.get(5) -> 'aB23r'

TODO
====
 - prevent nasty words by not using vovels or a more clever tick...


AUTHOR
======
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...