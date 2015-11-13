require "helper"

class Spall::Instructions::MIDITest < Minitest::Test

  context "MIDI" do

    setup do
      @input = Object.new
      @context = Spall::SamplePlayer.new(@input)
      assert @context.kind_of?(Spall::Instructions::MIDI)
    end

    context "#note" do

      setup do
        @context.midi.expects(:add_note_callback).once.returns({})
      end

      teardown do
        @context.midi.unstub(:add_note_callback)
      end

      should "assign callback" do
        refute_nil @context.note(1) { something }
      end

    end

    context "#cc" do

      setup do
        @context.midi.expects(:add_cc_callback).once.returns({})
      end

      teardown do
        @context.midi.unstub(:add_cc_callback)
      end

      should "assign callback" do
        refute_nil @context.cc(1) { |val| something }
      end

    end

    context "#system" do

      setup do
        @context.midi.expects(:add_system_callback).once.returns({})
      end

      teardown do
        @context.midi.unstub(:add_system_callback)
      end

      should "assign callback" do
        refute_nil @context.system(:stop) { something }
      end

    end

    context "#master_channel" do

      setup do
        @context.midi.expects(:master_channel=).once.with(3).returns(3)
      end

      teardown do
        @context.midi.unstub(:master_channel=)
      end

      should "assign callback" do
        refute_nil @context.master_channel(3)
      end

    end

  end
end
