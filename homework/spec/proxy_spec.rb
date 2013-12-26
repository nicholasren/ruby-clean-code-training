require 'spec_helper'

class Television
  attr_accessor :channel

  def power
    if @power == :on
      @power = :off
    else
      @power = :on
    end
  end

  def on?
    @power == :on
  end
end


describe Proxy do
  let(:tv) { Proxy.new(Television.new) }

  context "proxying methods" do
    subject {
      tv.channel = 10
      tv.power
      tv
    }

    it "does something" do
      subject.channel.should == 10
    end

    its(:channel).should == 10
    its(:on?).should be_true
  end

  context "record messages" do
    subject {
      tv.channel = 10
      tv.power
      tv
    }

    it "does something" do
      subject.messages.should =~ [:power, :channel=]
    end
  end

  context "record method call counts" do
    subject {
      tv.channel = 10
      tv.power
      tv.power
      tv
    }

    specify do
      subject.number_of_times_called(:power).should eq(2)
      subject.number_of_times_called(:channel=).should eq(1)
    end

  end

end
