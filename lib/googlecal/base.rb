module Googlecal
  # :title: Base
  class Base
    attr_accessor :credentials, :default_calendar
    # static instance
    # - GoogleCalendar Service service

    # TODO: not sure what this is for, needs documentation
    OOB_URL = 'urn:ietf:wg:oauth:2.0:oob'

    # Initialize a new googlecal instance and authenticate with google with file paths
    #
    # ==== Attributes
    #
    # * +:application_name:+ - Name of application in gooogle console that you need to setup
    # * +:authenticate_with_env:+ - Optionally authenticate with enviroment variables instead of client_secrets_path
    # * +:credentials_path:+  - The file path to loading credentials path
    # * +:client_secrets_path:+ - The file path to json file holding client secrets
    # * +:scope:+ -The access scope for the use of the google api session
    def initialize(application_name,
                   calendar_id = 'primary',
                   authenticate_with_env = false,
                   credentials_path = File.join(Dir.home, '.credentials',"calendar-ruby-quickstart.yaml"),
                   client_secrets_path = 'client_secret.json',
                   scope = Google::Apis::CalendarV3::AUTH_CALENDAR)
      # authenticate with google
      if authenticate_with_env
        # set credentials
        @credentials = authorize_with_env(scope)
      else
        # set credentials
        @credentials = authorize(credentials_path, client_secrets_path, scope)
      end
     @@calendar_service = setup_calendar_service(application_name, @credentials)
     @@calendar_id = calendar_id
    end

    def events(calendar_id = 'primary', **opts)
      @@calendar_service.list_events(calendar_id,
                                    max_results: 10)
    end

    def create_event(calendar_id = 'primary', **opts)
      event = Google::Apis::CalendarV3::Event.new(
        summary: opts[:summary] || '',
        location: opts[:location] || '',
        start: {
          date_time: Time.now.iso8601,
          time_zone: 'America/Los_Angeles',
        },
        end: {
          date_time: (Time.now + 10*60).iso8601,
          time_zone: 'America/Los_Angeles',
        }
      )
      result = @@calendar_service.insert_event(calendar_id, event)
      return result
    end

    # Delete an even from a calendar by event id
    #
    # ==== Attributes
    #
    # * +:calendar_id:+ - Unique id of calendar
    # * +:event_id:+ - Unique id of event to be deleted
    def delete_event(calendar_id = 'primary', event_id)
      result = @@calendar_service.delete_event(calendar_id, event_id)
      return result
    end

    # Get an event by event id
    #
    # ==== Attributes
    #
    # * +:calendar_id:+ - Unique id of calendar
    # * +:event_id:+ - Unique id of event
    # TODO: for some reason this part is not working with some of the tests i have tried
    # with it
    def get_event(calendar_id = 'primary', event_id)
      result = @@calendar_service.get_event(calendar_id, event_id)
      return result
    end

    private

    # Authenticate with google with file paths and a scope
    #
    # ==== Attributes
    #
    # * +:credentials_path:+ - The file path to loading credentials path
    # * +:client_secrets_path:+ - The file path to json file holding client secrets
    # * +:scope:+ - The access scope for the use of the google api session
    def authorize(credentials_path, client_secrets_path, scope)
      FileUtils.mkdir_p(File.dirname(credentials_path))
      client_id = Google::Auth::ClientId.from_file(client_secrets_path)
      token_store = Google::Auth::Stores::FileTokenStore.new(file: credentials_path)
      authorizer = Google::Auth::UserAuthorizer.new(client_id, scope, token_store)
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id)
      # check if loaded credentials exist
      if credentials.nil?
        url = authorizer.get_authorization_url(base_url: OOB_URL)
        # user must verify application
        puts "Open the following url in the browser"
        puts url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id,
          code: code,
          base_url: OOB_URL
        )
      end
      # return the produced credentials
      return credentials
    end

    # Authenticate with enviroment variables
    #
    # ==== Attributes
    #
    # * +:credentials_path:+ - The file path to store the credentials
    # * +:scope:+ - The access scope for the use of the google api session
    def authorize_with_env(scope)
      FileUtils.mkdir_p(File.dirname(ENV['GCAL_TOKEN_STORE_PATH']))
      # get values for env varibales
      client_id = Google::Auth::ClientId.new(ENV['GCAL_CLIENT_ID'], ENV['GCAL_CLIENT_SECRET'])
      # setup token store for the file
      token_store = Google::Auth::Stores::FileTokenStore.new(file: ENV['GCAL_TOKEN_STORE_PATH'])
      authorizer = Google::Auth::UserAuthorizer.new(client_id, scope, token_store)
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id)
      # check if loaded credentials exist
      if credentials.nil?
        url = authorizer.get_authorization_url(base_url: OOB_URL)
        # user must verify application
        puts "Open the following url in the browser"
        puts url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id,
          code: code,
          base_url: OOB_URL
        )
      end
      # return the produced credentials
      return credentials
    end

    # Setup calendar service for a session
    #
    # ==== Attributes
    #
    # * +:application_name:+ - Name of application setup in google console
    # * +:credentials:+ - User authentication credentials
    def setup_calendar_service(application_name, credentials)
      service = Google::Apis::CalendarV3::CalendarService.new
      service.client_options.application_name = application_name
      service.authorization = credentials
      # return service once it is setup
      return service
    end

    # controlled access to the initialized google calendar service provider
    def self.service
      # check if CalendarService has been initialized and setup
      if @@calendar_service.nil?
        puts 'Googlecal service has not been initialize, please initialize Googlecal::Base
        in order to use google calendar service'
        return nil
      else
        return @@calendar_service
      end
    end

    def self.calendar_id
      @@calendar_id
    end
  end
end
