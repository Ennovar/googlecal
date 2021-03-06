
# Googlecal
[![Build
Status](https://travis-ci.org/Ennovar/googlecal.svg?branch=master)](https://travis-ci.org/Ennovar/googlecal)
[![Gem
Version](https://badge.fury.io/rb/googlecal.svg)](https://badge.fury.io/rb/googlecal)

_simple wrapper for google calendar api for ruby_

[Documentation](https://ennovar.github.io/googlecal/)
## This project is in Alpha!!!

## Testing Setup
Before you are ready to start developing on the project there are a
couple steps to follow

1. make sure you have a google account... **DUH**
2. make sure you enable the account to access your google calendar, you
   can find directions for that
[here](https://developers.google.com/google-apps/calendar/quickstart/ruby)
3. download your client_secret.json file into the project directory,
   these will authenticate you. Dont worry the .gitignore will ignore
this file
4. run your tests with the following command inside the directory `rake
   spec`

**NOTE:** if you get the following output from running your tests

```
Open the following url in the browser ............
```
1. you need to cancel your tests
2. run `./bin/console`
3. in the irb console you need to run the following
   `Googlecal::Base.new('')`
4. the url should print out to the console, open the url in your browser
   and then use the code that is in the webpage and paste it into the
irb console to authenticate you.

**Then you are clear to start running tests**


## Generating Documentation
1. install rdoc with
```
gem install rdoc
```
2. generate the docs by running this command in the project directory
```
rdoc
```
