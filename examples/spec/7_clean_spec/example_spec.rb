require 'spec_helper'

describe "let" do
  describe "let the smallest thing possible" do
    let(:card) { CreditCard.new type: type }

    context 'when type is visa' do
      let(:type) { :visa }

      # examples...
    end

    context 'when type is mastercard' do
      let(:type) { :mastercard }

      # examples...
    end
  end
end

describe "subject" do
  describe "implicit subject" do
    describe CreditCard do
      it { should belong_to :address }
      it { should accept_nested_attributes_for :address }

      describe 'validations' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :card_number }
      end
    end
  end

  describe "explicit subject" do
    describe CreditCard do
      subject do
        CreditCard.new name: 'Ann', card_number: 1234
      end

      it { should be_valid }
    end
  end
end


describe "expect vs should" do
end


describe "customized matcher" do

end

describe "its" do
end
