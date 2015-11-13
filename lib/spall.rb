#
# Spall
# MIDI Controllable Audio Sample Player
#
# (c)2015 Ari Russo
# Apache 2.0 License
# https://github.com/arirusso/spall
#

# libs
require "audio-playback"
require "midi-eye"
require "midi-message"
require "timeout"
require "unimidi"

# modules
require "spall/instructions"
require "spall/midi"
require "spall/thread"

# classes
require "spall/sample_player"

module Spall

  VERSION = "0.0.1"

end
