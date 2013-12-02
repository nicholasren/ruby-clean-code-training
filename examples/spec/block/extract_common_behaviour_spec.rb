require 'spec_helper'

describe Client do

  let(:client) { Client.new }
  let(:socket) { double("Socket", close: true) }

  before(:each) do
    TCPSocket.should_receive(:new).and_return(socket)
  end

  it "should send message to socket" do
    socket.should_receive(:puts).with("Hello")
    client.send_message("Hello")
  end

  it "should receive message from socket" do
    socket.should_receive(:gets).and_return("Hello")
    client.receive_message.should eq("Hello")
  end

end

