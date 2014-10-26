##Taskmanager-vagrant

Installs MRI Ruby 2.1.3 and Nodejs among other things.

Requires that `taskmanager-web` be on the same level, as it tries to sync it.


##Install instructions:

- Download and install [VirtualBox](https://www.virtualbox.org/)

- Download and install [Vagrant](https://www.vagrantup.com/)

- Clone this repo

- Make sure that `taskmanager-web` is cloned right next to it

- Open in terminal

- Run `vagrant up`

- After Vagrant finished installing, run `vagrant ssh`

- Navigate to `/vagrant` and install required gems with `bundle install`

- start up Rails with `rails s`

- Open `http://localhost:3000` in a browser

