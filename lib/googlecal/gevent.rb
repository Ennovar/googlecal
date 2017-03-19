# A google calendar event object
module Googlecal
  class GEvent < Googlecal::Base
    attr_accessor :summary, :start_time, :end_time
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

    def summary=(value)
      @event.summary = value
    end

    def start_time
      @event.start.date_time
    end

    def start_time=(value)
      # set it to iso8601
      @event.start.date_time = value.iso8601
    end

    def end_time
      @event.end.date_time
    end

    def end_time=(value)
      @event.end.date_time = value.iso8601
    end

    def status
      @event.status
    end

    def save
      update(start: { date_time: start_time }, end: { date_time: end_time })
    end

    # create and save a new event through googles api
    def self.create(event_params, calendar_id = Base.calendar_id)
      # event creation
      event = service.insert_event(calendar_id, Google::Apis::CalendarV3::Event.new(event_params))
      if event
        return GEvent.new(event)
      else
        return false
      end
    end

    # delete event by event.id in googles api
    # DELETES EVENT
    def delete(calendar_id = Base.calendar_id)
      # delete instance of event
      # update event instance
      @event = service.delete_event(calendar_id, id)
      return true
    end

    # update google calendar event by event.id
    def update(params, calendar_id = Base.calendar_id)
      # delta update
      # TODO: update calendar event
      service.update_event(calendar_id, id, @event)
    end

    # find google calendar event by event_id
    # +:event_id:+ - Unique event id given by google cal api
    def self.find(event_id, calendar_id = Base.calendar_id)
      # find by google event id
      begin
        event = service.get_event(calendar_id, event_id)
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
