# A google calendar event object
module Googlecal
  class GEvent < Googlecal::Base
    # TODO: make it so that the event is tied to a calendar id and only use that
    # to update, create, delete
    # TODO: create a relationship between an instance of GEvent and a GCalendar

    # initialize with a google event instance
    def initialize(event = nil)
      @event = event
    end

    def id
      @event.id
    end

    def summary
      @event.summary
    end

    def status
      @event.status
    end

    # create and save a new event through googles api
    def self.create(event_params)
      # event creation
      event = service.insert_event('primary', Google::Apis::CalendarV3::Event.new(event_params))
      if event
        return GEvent.new(event)
      else
        return false
      end
    end

    # delete event by event.id in googles api
    # DELETES EVENT
    def delete
      # delete instance of event
      # update event instance
      @event = service.delete_event('primary', id)
      return true
    end

    # update google calendar event by event.id
    def update(params)
      # delta update
    end

    # find google calendar event by event_id
    # +:event_id:+ - Unique event id given by google cal api
    def self.find(event_id)
      # find by google event id
      begin
        event = service.get_event('primary', event_id)
        return event
      catch e
        return nil
      end
    end

    private

    # control access to parent classes static instance to googlapi service
    def service
      Googlecal::Base.service
    end
  end
end
