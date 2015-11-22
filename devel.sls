version-control:
  pkg.latest:
    - pkgs:
      - git

editors:
  pkg.latest:
    - pkgs:
      - vim
      - vim-latexsuite
      - vim-surround

terminal:
  pkg.latest:
    - pkgs:
      - xfce4-terminal

shell:
  pkg.latest:
    - pkgs:
      - zsh
      - zsh-syntax-highlighting

python:
  pkg.latest: []

haskell:
  pkg.latest:
    - pkgs:
      - ghc

texlive:
  pkg.latest:
    - pkgs:
      - texlive-core

network-tools:
  pkg.latest:
    - pkgs:
      - dnsutils
      - nmap
