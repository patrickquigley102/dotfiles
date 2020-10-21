# Load a Gem in any IRB Console

1. Enter bash session of machine in question.
2. `gem install gem_name`
3. `gem env gemdir`
4. 3 will provide the directory where all gems are installed, find the one you
   need E.G. [dir-from-step-3]/gems/factory_bot-6.1.0/lib
5. `bundle exec rails console` or a plain IRB console
6. Add the value from 4 into the LOAD_PATH global array: 
   `$LOAD_PATH << "[dir-from-step-4"`
7. `require 'gem_name'` <-- that will usually work, may have a slightly
   different entry point which you'd need to search for in the source code.
   
