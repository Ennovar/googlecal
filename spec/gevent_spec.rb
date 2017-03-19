require "spec_helper"

include Googlecal

describe Googlecal do
  describe Googlecal::GEvent do
    let(:event_params) {
      {
        summary: 'test event GEvent',
        end: {
          date_time: (Time.now + 10 *60).iso8601
        },
        start: {
          date_time: Time.now.iso8601
        }
      }
    }
    let(:setup_gcalendar) {
      Googlecal::Base.new('Googlecal Calendar API Ruby Quickstart')
    }

    before :each do
        @g = Googlecal::Base.new('Google Calendar API Ruby Quickstart')
        @test_event = @g.create_event('primary', summary: 'test GEvent')
    end

    after :each do
      @g.delete_event('primary', @test_event.id)
    end

    describe '.initialize' do
      it 'should create a new instance with no event' do
        gevent = GEvent.new()
        expect(gevent).not_to be_nil
      end
      it 'should create a new instance with an event' do
        gevent = GEvent.new(@test_event)
        expect(gevent).not_to be_nil
        expect(gevent.id).to be(@test_event.id)
      end
    end

    describe '.create' do
      before :each do
        @g = Googlecal::Base.new('Google Calendar API Ruby Quickstart')
      end
      it 'should create an event' do
        gevent = GEvent.create(event_params)
        expect(gevent.id).not_to be_nil
        expect(GEvent.find(gevent.id).id).to eq(gevent.id)
        # clean up
        gevent.delete
      end
    end

    describe '.delete' do
      before :each do
        setup_gcalendar
      end

      it 'should delete event' do
        gevent = GEvent.create(event_params)
        expect(gevent.id).not_to be_nil
        # save the id of the event to find by id and check if it was cancelled
        event_id = gevent.id
        gevent.delete
        expect(GEvent.find(event_id).status).to eq('cancelled')
      end
    end
    describe '.update' do
      before :each do
        setup_gcalendar
        @event = GEvent.create(event_params)
      end
      it 'should update event' do
        event = GEvent.new(@event)
        pending 'not implemented correctly yet'
        event.update(summary: 'test again')
      end
    end
    describe '.save' do
      before :each do
        setup_gcalendar
        @event = GEvent.create(event_params)
      end
      it 'should save event' do
        @event.summary = 'changed'
        @event.save
      end
    end
  end
end
