require 'spec_helper'

InactiveRecord::Base.config do |config|
  config.schema "spec/fixtures/schema.yml"
end

class Person < InactiveRecord::Base
end

describe "InactiveRecord" do
  context "save attribtues" do
    subject do
      juntao = Person.new do |p|
        p.name = 'juntao'
        p.age = 28
        p.email = 'juntao.qiu@gmail.com'
      end
      juntao
    end

    its(:name).should == 'juntao'
    its(:age).should == 18
  end

  context "schema validation" do
    subject {
      juntao = Person.new do |p|
        p.name = 'juntao'
        p.age = 28
        p.email = 'juntao.qiu@gmail.com'
      end
      juntao
    }

    context "change a valid field" do
      it "should succeed" do
        subject.age = 29
        subject.age.should = 29
      end
    end

    context "change a invalid field" do
      it "should raise error" do
        expect { subject.weight= 60 }.to raise_error(MissingFieldError)
      end
    end
  end
end
