# Environment Setup
A note of how I setup my environment for Ruby and Rails inside WSL.

## Setup `nvm` on wsl
Following [microsoft docs](https://docs.microsoft.com/en-us/windows/dev-environment/javascript/nodejs-on-wsl)

## Setup `rvm` on wsl
Following [rvm github](https://github.com/rvm/ubuntu_rvm)

# Other topics
Some other trouble I get into, haih...

## Reset password on WSL
Long story short.. change to root user and chpsswd for liew user, then relogin back.

## View a file in WSL
`wslview filename.pdf`

## Unable to donwgrade yarn
Checkout this [github issue](https://github.com/yarnpkg/berry/issues/3180)

## Don't run bundler as root
Explained in [stackoverflow](https://stackoverflow.com/questions/25437817/dont-run-bundler-as-root-what-is-the-exact-difference-made-by-using-root#:~:text=If%20you%20run%20ruby%20bundler,root%20users%20on%20this%20machine.).

## Package directory not part of the project
Received a warning messsage: "The nearest package directory doesn't seem to be part of the project". Turns out it is because there's a yarn.lock (or package.json) file higher up in the filetree, see this [github issue](https://github.com/yarnpkg/berry/issues/2212)

## Unable to host in heroku
### Heroku bundle version
### Heroku yarn version
- [No matching yarn versin](https://help.heroku.com/8MEL050H/why-is-my-node-js-build-failing-because-of-no-matching-yarn-versions)
- Additionally, to change yarn version, somehow I need to delete .yarnrc file, shown in [stackoverflow](https://stackoverflow.com/questions/54567872/outdated-yarn-lockfile-error-on-deploying-app-on-heroku).

## rails console stop working when used Ctrl + c 
Use `$ bin/spring stop` , [stackoverflow](https://stackoverflow.com/questions/25027284/ruby-on-rails-console-is-hanging-when-loading)
