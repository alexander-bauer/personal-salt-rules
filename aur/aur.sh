#!/bin/bash
PKGNAME=$1
curl "https://aur.archlinux.org/cgit/aur.git/snapshot/$PKGNAME.tar.gz" | tar xz
cd "$PKGNAME"
makepkg --install --noconfirm --skippgpcheck --clean
