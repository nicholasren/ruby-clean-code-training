require 'lib/inactive_record'

InactiveRecord::Base.config do |config|
  config.schemas "spec/fixtures/schema.yml"
end

class Person < InactiveRecord::Base
end

describe "InactiveRecord" do
  context "save attribtues" do
    subject {
      juntao = Person.new do |p|
        p.name = 'juntao'
        p.age = 28
        p.email = 'juntao.qiu@gmail.com'
      end
      juntao
    }

    it "should read saved attributes " do
      subject.name.should == 'juntao'
      subject.age.should == 28
      subject.email.should == "juntao.qiu@gmail.com"
    end
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
        subject.age.should == 29
      end
    end

    context "change a invalid field" do
      it "should raise error" do
        expect { subject.weight= 60 }.to raise_error(StandardError)
      end
    end
  end
end
