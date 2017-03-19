# A google calendar object
module Googlecal
  class GCalendar < Base

    # initialize
    def initialize()
      puts 'hello'
      puts Base.calendar_service
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

    private

    def service
      Base.service
    end
  end
end
