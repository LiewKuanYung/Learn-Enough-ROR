# DEVELOPER NOTE
Note for developer. Haha just kidding. This is a note that records some of the setup process or technical issues faced during the development of this project.

## Environment Setup
---
A note of how I setup my environment for Ruby and Rails inside WSL.

### Setup `nvm` on wsl
- Following [microsoft docs](https://docs.microsoft.com/en-us/windows/dev-environment/javascript/nodejs-on-wsl)

### Setup `rvm` on wsl
- Following [rvm github](https://github.com/rvm/ubuntu_rvm)





## Extra learning
---

### Ruby data structure
- arrays & ranges
- hashes & [symbols](https://www.rubyguides.com/2018/02/ruby-symbols/)
- block 
- Instance variable vs local variable vs class variable

### Testing
- Article about [red, green, & refactor](https://www.codecademy.com/article/tdd-red-green-refactor)
- [ActiveSupport::Testing::Assertions](https://api.rubyonrails.org/v5.2/classes/ActiveSupport/Testing/Assertions.html), there are many assertions example here.

### Partials
- Example, the `_file.html.erb` with underscore at front is the convention of defining partials. Partials is like a snippet of code that could be inserted into other html.erb codes.

### has_secure_password
- password digest, aka, hashed password.

### Fixture
- Fixtures are a way of organizing data for testing. [ActiveRecord::Fixtures](https://api.rubyonrails.org/v3.1/classes/ActiveRecord/Fixtures.html)

### Attribute accessor
- Basically a shortcut for instance variable functionality. Learn more about [attr_accessor](https://www.rubyguides.com/2018/11/attr_accessor/)

### What is Action Dispatch
Basically, rails consists of 3 Action Packs
- Action Dispatch routes request to controllers
- Action Controller converts requests into responses
- Action View is used by Action Controller to format those reponse <br>

Learn more in this [blog](http://dylanninin.com/blog/2013/11/26/rails4_ad_ac.html)

### Ruby keywords
- `Raise` an exception
- `debugger` to debug

### What does `<<` mean in Ruby?
- Basically add to the end of this array, see also this [stackoverflow](https://stackoverflow.com/questions/6852072/what-does-mean-in-ruby) or this [ruby doc](https://ruby-doc.org/core-3.1.1/Array.html#M000225)

### HTML
- `<strong>` tag shows the text with strong importance and it's usually **bold**





## Other topics
---
Some other troubles I got into, haih...

### Reset password on WSL
- Long story short.. change to root user and chpsswd for liew user, then relogin back.

### View a file in WSL
- `wslview filename.pdf`

### Unable to donwgrade yarn
- Checkout this [github issue](https://github.com/yarnpkg/berry/issues/3180)

### Don't run bundler as root
- Explained in [stackoverflow](https://stackoverflow.com/questions/25437817/dont-run-bundler-as-root-what-is-the-exact-difference-made-by-using-root#:~:text=If%20you%20run%20ruby%20bundler,root%20users%20on%20this%20machine.).

### Package directory not part of the project
- Received a warning messsage: "The nearest package directory doesn't seem to be part of the project". Turns out it is because there's a yarn.lock (or package.json) file higher up in the filetree, see this [github issue](https://github.com/yarnpkg/berry/issues/2212)

### Unable to host in heroku
#### Heroku bundle version
#### Heroku yarn version
- [No matching yarn versin](https://help.heroku.com/8MEL050H/why-is-my-node-js-build-failing-because-of-no-matching-yarn-versions)
- Additionally, to change yarn version, somehow I need to delete .yarnrc file, shown in [stackoverflow](https://stackoverflow.com/questions/54567872/outdated-yarn-lockfile-error-on-deploying-app-on-heroku).

### rails console stop working when used Ctrl + c 
- Use `$ bin/spring stop` , [stackoverflow](https://stackoverflow.com/questions/25027284/ruby-on-rails-console-is-hanging-when-loading)

### SQLite3 Locked
- Error: `ActiveRecord :: StatementInvalid: SQLite3 :: BusyException: database is locked`, tried all methods listed [here](https://linuxtut.com/en/fbb4cb2d4c392063c9a9/). However, the one that only works is ... restarting my computer...
