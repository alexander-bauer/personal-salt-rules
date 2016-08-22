# Personal Salt Rules

This repository contains rules that I use to reprovision my computer (or
reconfigure tricky software) after a new install, or breaking changes. It has a
reasonable logical divide between states and pillars, and hence does not contain
passwords or other sensitive or overly-specific data. 

I reprovision my computer from scratch reasonably frequently, because I use
[Arch Linux][] and am not very careful about packages. After the core install,
it takes me a long time to make my software and services work the way I want.
Hence, I wrote these rules alongside reprovisioning my laptop.

For example, I use Salt to install X packages, [LightDM][],
[Awesome][AwesomeWM], [redshift][], and other nice software, as well as drop
Xorg configuration files (Synaptics) into place. It also installs drivers I
need, and may have had to search extensively to find names for ---
`xf86-video-intel`, for example, which enables my backlight controls.

[Arch Linux]: https://www.archlinux.org
[LightDM]:    https://wiki.archlinux.org/index.php/Lightdm
[AwesomeWM]:  http://awesome.naquadah.org
[redshift]:   http://jonls.dk/redshift
