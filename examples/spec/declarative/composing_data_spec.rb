require 'spec_helper'

describe 'composing data' do
  let (:li_lei) { Student.new('LI Lei') }
  let (:han_meimei) { Student.new('HAN Meimei') }
  let (:kate) { Student.new('Kate') }

  let(:math) { Course.new('Math') }
  let(:english) { Course.new('English') }
  let(:physical) { Course.new('Physical') }
  let(:calculator) { Calculator.new }
  let(:students) { [li_lei, han_meimei, kate] }

  before do
    li_lei.assign(math, 5)
    li_lei.assign(english, 4)
    li_lei.assign(physical, 3)

    han_meimei.assign(math, 4)
    han_meimei.assign(english, 4)
    han_meimei.assign(physical, 4)

    kate.assign(math, 3)
    kate.assign(english, 5)
    kate.assign(physical, 5)
  end


  context 'total average' do
    subject { calculator.total_average(students) }
    it "be calculated" do
      expect(subject).to eq(12)
    end
  end

  context 'course average' do
    subject { calculator.course_average(students, 'math') }
    it "be calculated" do
      expect(subject).to eq(4)
    end
  end
end
