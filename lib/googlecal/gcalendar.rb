# A google calendar object
module Googlecal
  class GCalendar < Base

    # initialize
    def initialize()
    end

    def delete
      # delete calendar
    end

    def update(params)
      # delta update
    end

    def self.find(calendar_id)
      # find by goole calendar id
    end

    def self.all
      service.list_calendar_lists
    end

    private

    def service
      Base.service
    end
  end
end
