module Spall

  module MIDI

    class Wrapper

      attr_reader :listener, :master_channel, :message_handler

      def initialize(inputs)
        @message_handler = MessageHandler.new
        @master_channel = nil
        @listener = MIDIEye::Listener.new(inputs)
      end

      # Change the subscribed MIDI channel (or nil for all)
      # @param [Fixnum, nil] channel
      # @return [Fixnum, nil]
      def master_channel=(channel)
        @listener.event.clear
        @master_channel = channel
        populate_listener if @listener.running?
        @master_channel
      end

      def start
        populate_listener
        @listener.start(:background => true)
        true
      end

      def stop
        @listener.stop
        true
      end

      # Add a callback for a given MIDI system message
      # @param [String, Symbol] command The MIDI system command eg :start, :stop
      # @param [Proc] callback The callback to execute when the given MIDI command is received
      # @return [Hash]
      def add_system_callback(command, &callback)
        @message_handler.add_callback(:system, command, &callback)
      end

      # Add a callback for a given MIDI note
      # @param [Fixnum, String, nil] note The MIDI note to add a callback for eg 64 "E4"
      # @param [Proc] callback The callback to execute when the given MIDI note is received
      # @return [Hash]
      def add_note_callback(note, &callback)
        @message_handler.add_note_callback(note, &callback)
      end

      # Add a callback for a given MIDI control change
      # @param [Fixnum, nil] index The MIDI control change index to add a callback for eg 10
      # @param [Proc] callback The callback to execute when the given MIDI control change is received
      # @return [Hash]
      def add_cc_callback(index, &callback)
        @message_handler.add_callback(:cc, index, &callback)
      end

      private

      def populate_listener
        @listener.on_message do |event|
          message = event[:message]
          @message_handler.process(@channel, message)
        end
      end

    end

  end

end
