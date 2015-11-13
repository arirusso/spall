# Spall

MIDI Controllable Audio Sample Player

## Installation

These packages must be installed first:

* libsndfile ([link](https://github.com/erikd/libsndfile))
* portaudio ([link](http://portaudio.com/docs/v19-doxydocs/pages.html))

Both libraries are available in *Homebrew*, *APT*, *Yum* as well as many other package managers. For those who wish to compile themselves or need more information about those packages, follow the links above for more information

Once those libraries are installed, install the gem itself using

    gem install spall

Or if you're using Bundler, add this to your Gemfile

    gem "spall"
    
## Usage

```ruby
require "spall"

@input = UniMIDI::Input.gets

@player = Spall::SamplePlayer.new(@input) do

  note("C1") { play("kick.wav") }
  note("D1") { play("snare1.wav") }
  note("E1") { play("snare2.wav") }
  note("Bb1") { play("hihat.wav") }

end

@player.start
```

## License

Licensed under Apache 2.0, See the file LICENSE

Copyright (c) 2015 [Ari Russo](http://arirusso.com)