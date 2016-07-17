# Authorizor
At this stage the gem provides page specific authorization for controllers.

## Usage
The gem allows you to free your controllers from tons of authorization callbacks.

Authorizor uses the naming convension to include authorizers to their corresponding controllers.
Let's create and authorizer for `UsersController`:
1. Create a file in `app/authorizers` and call it `users_authorizer.rb`(important).
2. Inside the file create a module with name, similar to your controller's name
   including all parent modules and namespaces. For Example if I have `Admin::UsersController`,
   my authorizer module should be called `Admin::UsersAuthorizer` and should be placed under
   `app/authorizers/admin/users_authorizer.rb`, Thats it.
3. Now in your authorizer module you can call method `authorize` and your controller will be safe.

## Installation
First you have to add the gem to your Gemfile:

```ruby
gem 'authorizor'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install authorizor
```

To make it work you have to initialize the gem firstly:
```# app/config/initializers/
Authorizor.init
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
