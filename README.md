.dotfiles
=========

These are my personal dotfiles (sanitised to remove specific client or project commands), but
are useful for cleaning up my personal shell.

Used For
--------

* [bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)) shell
* [git](http://git-scm.com/) configuration, including:
  * [GitHub](https://github.com) configuration
* [iftop](http://www.ex-parrot.com/pdw/iftop/) configuration
* [Sublime Text 2](http://www.sublimetext.com/2) Preferences, including:
  * [Sublime Package Control](https://sublime.wbond.net/) Preferences

Usage:
------

I usually have my dotfiles symlink'd from my projects folder to my HOME directory:
`ln -s /projects/.dotfiles/ ~/.dotfiles`

Then I copy the `.bash_profile.template` to make a local `.bash_profile` in my HOME directory:
`cp /.dotfiles/.bash_profile.template ~/.bash_profile` - you could also do this set by manually editing the existing .bash_profile file.

(after some [Homebrew](https://github.com/mxcl/homebrew) installation...)

Then I set up the various sym-links for configuring Homebrew items:
```
ln -s /.dotfiles/.gitaliasconfig .gitaliasconfig
ln -s /.dotfiles/.gitconfig .gitconfig
ln -s /.dotfiles/.githubconfig .githubconfig
ln -s /.dotfiles/.iftoprc .iftoprc
```

You'll need to edit the `.githubconfig` file with your specific secret tokens, as well as the `.gitconfig` file with your desired commit author name & email.

Once [Sublime Text 2](http://www.sublimetext.com/2) with [Sublime Package Control](https://sublime.wbond.net/) is installed, I can then use the `Preferences.sublime-settings`
in `~/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings`, either through:

* symlinking: `ln -s /.dotfiles/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings`
* manual editing, preferably through Sublime Text so you see the changes immediately!

I use the [Inconsolata font](http://www.levien.com/type/myfonts/inconsolata.html) in Sublime Text 2, so you'll want to install that as well.

And now you can enjoy a brand new configuration!