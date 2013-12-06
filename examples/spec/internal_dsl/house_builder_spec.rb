require 'spec_helper'
###################################################
# use block and instance_eval to create beautiful #
# internal DSL                                    #
###################################################

describe HouseBuilder do
  subject {
    HouseBuilder.build :home do
      floor(1) {
        room :den
        room :kitchen
      }

      floor(2) {
        room :bedroom
        room :bathroom
      }
    end
  }

  its(:name) { should eq(:home) }
  context "house builder" do
    it "should have 2 floors" do
      subject.floors.size.should eq(2)
    end
  end
end
