require 'spec_helper'

describe ProtectionProxy do
  class User
    attr_accessor :name, :email, :membership_level

    def initialize(name, email, membership_level)
      @name = name
      @email = email
      @membership_level = membership_level
    end
  end

  class ProtectedUser
    extend ProtectionProxy

    role :owner do
      writable :membership_level
    end

    role :browser do
      writable :name
      writable :email
    end
  end


  let(:user) { User.new("Jim", "jim@somewhere.com", "Beginner") }

  context "when user is the owner role" do

    let(:proxy){ ProtectedUser.find_proxy(user, :owner) }

    context "when I change a writable attribute" do
      it "should be changed" do
        proxy.membership_level = "Advanced"
        proxy.membership_level.should == "Advanced"
      end
    end

    context "when I change a protected attribute" do
      it "should not be changed" do
        proxy.name = "Joe"
        proxy.name.should == "Jim"
      end
    end
  end

  context "when user is the brower role" do
    let(:proxy){ ProtectedUser.find_proxy(user, :browser) }

    context "when I change a writable attribute" do
      it "should be changed" do
        proxy.name = "Joe"
        proxy.name.should == "Joe"
      end
    end

    context "when I change a protected attribute" do
      it "should not be changed" do
        proxy.membership_level = "SuperUser"
        proxy.membership_level.should == "Beginner"
      end
    end
  end
end
