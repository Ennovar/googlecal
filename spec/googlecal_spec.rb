require "spec_helper"

describe Googlecal do
  describe Googlecal::Base do
    describe 'initialize' do
      it 'should initialize with file' do
        if !File.exists?('client_secret.json')
          g = Googlecal::Base.new('Google Calendar API Ruby Quickstart')
          expect(g.credentials).not_to be_nil
        else
          skip 'unable to authenticate with file.... add client_secret.json to project directory'
        end
      end
      it 'should initialize with env' do
        puts ENV['GCAL_TOKEN_STORE_PATH']
        if ENV['GCAL_CLIENT_ID']
          g = Googlecal::Base.new('Google Calendar API Ruby Quickstart', true)
          expect(g.credentials).not_to be_nil
        else
          skip 'enviroment not setup to pass with test, skipped'
        end
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
     end
    end
    describe '.get_event' do
      before :each do
        @g = Googlecal::Base.new('Google Calendar API Ruby Quickstart')
        @event = @g.create_event('primary', summary: 'test')
        puts @event.to_json
      end
      after :each do
        # delete event that was created
        @g.delete_event(@event.id)
      end
      it 'should get event with same id' do
        event = @g.get_event('primary', @event.id)
        expect(event.id).to eq(@event.id)
      end
    end
  end
end
