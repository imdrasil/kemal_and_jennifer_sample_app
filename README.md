# Jennifer + Kemal sample application

This is a project presenting efficient integration of [Jennifer](https://github.com/imdrasil/jennifer.cr) ORM and [Kemal](http://kemalcr.com) web framework.

This project is inspired by [Ruby on Rails Tutorial sample application](https://bitbucket.org/railstutorial/sample_app_4th_ed).

## Getting Started

To get started with the app, clone the repo and then install the needed dependencies:

```shell
$ cd /path/to/repos
$ git clone git@github.com:imdrasil/spider-gazelle_jennifer_sample_app.git
$ cd spider-gazelle_jennifer_sample_app
$ shards
$ make setup
```

The last command copies `./config/database.yml.example` to `./config/database.yml`. All database parameters are located in `./config/database.yml` - complete them with your own values.

Next do the database setup.

```shell
$ make sam db:setup
```

This will automatically create development database, run all migrations and populate seeds.

To start a dev server run in a separate console tabs next commands:

```shell
$ make server
$ make webpack
```

### NOTES

Proposed controller-based architecture for a Kemal application and shouldn't be considered as a best practice.

### Dependencies

This is the lists of top-level application dependencies.

* [kemal](https://github.com/kemalcr/kemal) - web framework used to build this application;
* [kemal-session](https://github.com/kemalcr/kemal-session) - session support for kemal;
* [kemal-session-redis](https://github.com/crisward/kemal-session-redis) - redis engine for kemal session;
* [jennifer](https://github.com/imdrasil/jennifer.cr) - ORM with DB migrating tool;
* [sam](https://github.com/imdrasil/sam.cr) - task/script manager (is used only for some commands - Amber provides own CLI);
* [pg](https://github.com/will/crystal-pg) - PostgreSQL driver;
* [carbon](https://github.com/luckyframework/carbon) - email library;
* [form_object](https://github.com/imdrasil/form_object) - library provides Form Object pattern - allows to move all parameter parsing and data validating logic outside of models and controllers;
* [pager](https://github.com/imdrasil/pager) - simple pagination library;
* [view_model](https://github.com/imdrasil/view_model.cr) - View-Model layer - allows to encapsulate all view-related logic in a separate classes and brings HTML helper methods.
* [slang](https://github.com/jeromegn/slang) - template language;
* [http_method_emulator](https://github.com/imdrasil/http_method_emulator) - library to emulate all HTTP methods by sending method name in `_method` query parameter in `POST` request;
* [flash_container](https://github.com/imdrasil/flash_container.cr) - simple flash messages container.

#### Development dependencies

* [email_opener](https://github.com/imdrasil/email_opener) - opens all sent emails in a browser tab;
* [spec-kemal](https://github.com/kemalcr/spec-kemal) - test helpers for a kemal app.

## Tests

TBA

## TODO

* [ ] implement "Remember me* using cookies
* [ ] cover functionality with tests
* [ ] 404 and 500 pages; "rescue from" functionality

## Contributing

1. Fork it ( https://github.com/imdrasil/test/fork )
2. Create your feature branch ( `git checkout -b my-new-feature` )
3. Commit your changes ( `git commit -am 'Add some feature'` )
4. Push to the branch ( `git push origin my-new-feature` )
5. Create a new Pull Request

## Contributors

- [imdrasil](https://github.com/imdrasil) Roman Kalnytskyi - creator, maintainer
