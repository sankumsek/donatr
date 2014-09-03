#Donatr
Donatr lets users create and donate to causes.

The project is for the [Conventional rails assessment](http://www.learnhowtoprogram.com/lessons/conventional-rails-assessment) for [Epicodus](http://www.epicodus.com/).

##Setup
In your terminal, clone this repo:

```console
$ clone https://github.com/nrbernard/donatr.git
```

Make sure you've installed [postgres](http://www.postgresql.org/download/) and have started the server:

```console
$ postgres
```

Install all the dependencies:

```console
$ bundle install
```

Set up the databases on your local machine:

```console
$ rake db:create
$ rake db:schema:load
```

Finally, start the rails server:

```console
$ rails s
```
It should now be available at `localhost:3000`.

Alternatively, the live app is on [Heroku](http://donatr.herokuapp.com/).

##Author
[Nick Bernard](http://nrbernard.com)

##License
MIT
