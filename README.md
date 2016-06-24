###My dotfiles!###
I spend a lot of time configuring VIM to my liking, so it'd be
a waste to lose it all...

####includes####
#####.vimrc#####
I use vundle as a plugin manager. this isn't entirely portable, as
YCM requires vim built with python, which barebones vim installs on unix
machines aren't, but everything else should port just fine.
I've noop-ed the standard movement keys using this method
http://jeetworks.org/from-acolyte-to-adept-the-next-step-after-nop-ing-arrow-keys/
so that I have to used numbered movements, or get used to more powerful
movement techniques

#####.bash_profile#####
relevant aliases and PATH config
not really portable, but I want to store it here

#####.eslintrc#####
generic .eslint in home directory.  Should only act as a fallback
for quick prototypes that don't require a customized lint config

