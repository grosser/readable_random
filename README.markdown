Readable string for coupon codes or auth tokens, something people can read/write and do not confuse.

 - more information density than hex -> shorter codes
 - less confusion than base64 -> readable codes
 - less 'stupid' then ActiveSupport::SecureRandom, e.g. hex(5).size == 5, not 10

Install
=======
 - As gem: ` sudo gem install readable_random `
 - As Rails plugin: ` script/plugin install git://github.com/grosser/readable_random.git `

Usage
=====
    ReadableRandom.get(5) -> 'aB23r'

    # user.rb
    def generate_token
      while token.blank? or User.find_by_token(token)
        self.token = ReadableRandom.get(6)
      end
    end

    ReadableRandom.hex(5) -> '12af4'
    ReadableRandom.base64(5) -> 'at12k'

TODO
====
 - prevent nasty words by not using vovels or a more clever tick...


AUTHOR
======
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...