require "spec_helper"

describe Googlecal do
  describe Googlecal::Base do
    before :each do
      if !File.file?('client_secret.json')
        throw "Please add your client secrets to client_secret.json to authenticate before running tests"
      end
    end
    describe 'initialize' do
      it 'should work' do
        g = Googlecal::Base.new('Google Calendar API Ruby Quickstart')
        expect(g.credentials).not_to be_nil
      end
    end

    describe '.create_event' do
      before :each do
        @g = Googlecal::Base.new('Google Calendar API Ruby Quickstart')
        @events_created = []
      end
      after :each do
        @events_created.each do |event|
          @g.delete_event('primary', event.id)
        end
      end
      it 'should create an event' do
       event = @g.create_event('primary', summary: 'test')
       expect(event).not_to be_nil
       @events_created.push(event)
      end
    end

    describe '.delete_event' do
      before :each do
        @g = Googlecal::Base.new('Google Calendar API Ruby Quickstart')
        @events_created = []
      end
      it 'should delete an event' do
        pending 'get_event is not working for some reason'
        event = @g.create_event('primary', summary: 'test delete')
        expect(event).not_to be_nil
        # this part is broken
        e = @g.get_event('primary', event.id)
        @g.delete_event('primary', event.id)
      end
    end
  end
end
