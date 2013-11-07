require 'spec_helper'

describe Server do
  let(:server) {
    Server.generate do
      handle(/hello/i) { "Hello from server" }
      handle(/play/i) { "play from server" }
    end
  }

  subject { server.recieve(request) }

  context "matched" do
    let(:request) { "hello" }
    it "should handle matched pattern" do
      subject.should eq("Hello from server")
    end
  end

  context "not matched" do
    let(:request) { "not matched" }
    it "shooud reutrn nil" do
      subject.should be_nil
    end
  end

end
