require "spec_helper"

include Googlecal

describe Googlecal do
  describe Googlecal::GCalendar do
    describe '.new' do

    end

    describe '.all' do
      before :each do
        @g = Googlecal::Base.new('idk')
      end
      it 'should get all calendars' do
        puts Googlecal::GCalendar.all
      end
    end
  end
end
