# encoding: UTF-8
require 'spec_helper'

describe HL7::Message do
  context 'bad input parsing' do
    before :all do
      @random_input = Random.bytes(512 * 1024)
    end

    it 'handles pathological input' do
      msg = HL7::Message.new
      expect do
        Timeout::timeout(5) do
          msg.parse @random_input
        rescue HL7::Exception
        end
      end.not_to raise_error
    end
  end
end
