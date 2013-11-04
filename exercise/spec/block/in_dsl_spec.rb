require 'spec_helper'

describe Table do
  subject {
    Table.generate do
      row do
        cell "Hello"
        cell "World"
      end

      row do
        cell "Thought"
        cell "Works"
      end
    end
  }

  context "generated" do
    it "should generate a table with cell" do
      subject.as_printable_string.should include("Hello")
    end
  end

end
