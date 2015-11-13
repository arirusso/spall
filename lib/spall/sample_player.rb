module Spall

  class SamplePlayer

    include Instructions::MIDI

    attr_reader :midi

    def initialize(midi_inputs, options = {}, &block)
      @midi = MIDI::Wrapper.new(midi_inputs)
      instance_eval(&block) if block_given?
    end

    def start(options = {})
      @midi.start
      @playback_thread = playback_loop
      @playback_thread.join unless !!options[:background]
      true
    end

    def stop
      @midi.stop
      @playback_thread.kill
      true
    end

    private

    # Main playback loop
    def playback_loop
      Spall::Thread.new(:timeout => false) do
        until !@midi.listener.running?
          sleep(0.1)
        end
      end
    end

  end

end
