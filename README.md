# spotify-blacklist-mute
*for muting ads on Windows*

The file `spotifymute_helper.sh` has been completely written from scratch in order to work from Windows.

At this time, the dependencies in order to work from windows are the following:

- [Cygwin](https://cygwin.com)
- [screen terminal multiplexer](https://cygwin.com/cgi-bin2/package-cat.cgi?file=x86%2Fscreen%2Fscreen-4.5.1-2&grep=screen)
- [nircmd tool on windows](http://www.nirsoft.net/utils/nircmd.html)


The startup script (`spotifymute`) launches GNU Screen, so if everything works according to plan, you can detach using e.g. `<Control-A> <Control-D>`.

The Python utility `when-changed` is not available on this fork since the module [pyinotify](http://www.nirsoft.net/utils/nircmd.html) is not available on Windows, so I deleted the submodule.

There is a reimplementation of this application entirely in Python [here](https://github.com/digfish/spotify-blacklist-mute-windows), with no dependencies on Cygwin.

Todo
----

* Port the tool [when-changed](https://github.com/joh/when-changed) to Windows.

