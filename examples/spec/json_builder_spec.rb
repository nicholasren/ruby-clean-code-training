require 'spec_helper'
require 'json'

describe ObjectBuilder do
  class Person
    attr_accessor :name
  end


  subject { builder.build json }

  context "empty instance" do
    let(:builder) do
      ObjectBuilder.config do |builder|
        builder.obj_class Person
      end
    end
    let(:json) { {}.to_json }

    it{ should_not be_nil }
  end

  context "with simple field mapping" do
    let(:builder) do
      ObjectBuilder.config do |builder|
        builder.obj_class Person
        builder.rule("$person.name", :name)
      end
    end
    let(:json) { {person: { name: "Jim" }}.to_json }

    its(:name) { should eq("Jim") }
  end
end
