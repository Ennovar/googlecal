var search_data = {"index":{"searchIndex":["googlecal","base","gcalendar","gevent","object","create()","create_event()","delete()","delete()","delete_event()","end_time=()","events()","find()","find()","get_event()","id()","new()","new()","new()","save()","start_time=()","status()","summary=()","update()","update()","gemfile","gemfile.lock","license","readme","rakefile","setup","client_secret.json","googlecal.gemspec"],"longSearchIndex":["googlecal","googlecal::base","googlecal::gcalendar","googlecal::gevent","object","googlecal::create()","googlecal::base#create_event()","googlecal#delete()","googlecal::gcalendar#delete()","googlecal#delete_event()","googlecal::gevent#end_time=()","googlecal::base#events()","googlecal::find()","googlecal::gcalendar::find()","googlecal#get_event()","googlecal::gevent#id()","googlecal::base::new()","googlecal::gcalendar::new()","googlecal::gevent::new()","googlecal::gevent#save()","googlecal::gevent#start_time=()","googlecal::gevent#status()","googlecal::gevent#summary=()","googlecal#update()","googlecal::gcalendar#update()","","","","","","","",""],"info":[["Googlecal","","Googlecal.html","","<p>A google calendar object\n<p>A google calendar event object\n"],["Googlecal::Base","","Googlecal/Base.html","",""],["Googlecal::GCalendar","","Googlecal/GCalendar.html","",""],["Googlecal::GEvent","","Googlecal/GEvent.html","",""],["Object","","Object.html","",""],["create","Googlecal","Googlecal.html#method-c-create","(event_params, calendar_id = Base.calendar_id)","<p>create and save a new event through googles api\n"],["create_event","Googlecal::Base","Googlecal/Base.html#method-i-create_event","(calendar_id = 'primary', **opts)",""],["delete","Googlecal","Googlecal.html#method-i-delete","(calendar_id = Base.calendar_id)","<p>delete event by event.id in googles api DELETES EVENT\n"],["delete","Googlecal::GCalendar","Googlecal/GCalendar.html#method-i-delete","()",""],["delete_event","Googlecal","Googlecal.html#method-i-delete_event","(calendar_id = 'primary', event_id)","<p>Delete an even from a calendar by event id\n<p>Attributes\n<p><code>:calendar_id:</code> - Unique id of calendar\n"],["end_time=","Googlecal::GEvent","Googlecal/GEvent.html#method-i-end_time-3D","(value)",""],["events","Googlecal::Base","Googlecal/Base.html#method-i-events","(calendar_id = 'primary', **opts)",""],["find","Googlecal","Googlecal.html#method-c-find","(event_id, calendar_id = Base.calendar_id)","<p>find google calendar event by event_id <code>:event_id:</code> - Unique\nevent id given by google cal api\n"],["find","Googlecal::GCalendar","Googlecal/GCalendar.html#method-c-find","(calendar_id)",""],["get_event","Googlecal","Googlecal.html#method-i-get_event","(calendar_id = 'primary', event_id)","<p>Get an event by event id\n<p>Attributes\n<p><code>:calendar_id:</code> - Unique id of calendar\n"],["id","Googlecal::GEvent","Googlecal/GEvent.html#method-i-id","()",""],["new","Googlecal::Base","Googlecal/Base.html#method-c-new","(application_name, calendar_id = 'primary', authenticate_with_env = false, credentials_path = File.join(Dir.home, '.credentials',\"calendar-ruby-quickstart.yaml\"), client_secrets_path = 'client_secret.json', scope = Google::Apis::CalendarV3::AUTH_CALENDAR)","<p>Initialize a new googlecal instance and authenticate with google with file\npaths\n<p>Attributes\n<p><code>:application_name:</code> …\n"],["new","Googlecal::GCalendar","Googlecal/GCalendar.html#method-c-new","()","<p>initialize\n"],["new","Googlecal::GEvent","Googlecal/GEvent.html#method-c-new","(event = nil)","<p>initialize with a google event instance\n"],["save","Googlecal::GEvent","Googlecal/GEvent.html#method-i-save","()",""],["start_time=","Googlecal::GEvent","Googlecal/GEvent.html#method-i-start_time-3D","(value)",""],["status","Googlecal::GEvent","Googlecal/GEvent.html#method-i-status","()",""],["summary=","Googlecal::GEvent","Googlecal/GEvent.html#method-i-summary-3D","(value)",""],["update","Googlecal","Googlecal.html#method-i-update","(params, calendar_id = Base.calendar_id)","<p>update google calendar event by event.id\n"],["update","Googlecal::GCalendar","Googlecal/GCalendar.html#method-i-update","(params)",""],["Gemfile","","Gemfile.html","","<p>source &#39;rubygems.org&#39;\n<p># Specify your gem&#39;s dependencies in googlecal.gemspec gemspec\n"],["Gemfile.lock","","Gemfile_lock.html","","<p>PATH\n\n<pre>remote: .\nspecs:\n  googlecal (0.1.0)\n    google-api-client</pre>\n<p>GEM\n"],["LICENSE","","LICENSE.html","","<p>MIT License\n<p>Copyright © 2017 Ennovar\n<p>Permission is hereby granted, free of charge, to any person obtaining …\n"],["README","","README_md.html","","<p>Googlecal\n<p><img src=\"https://travis-ci.org/Ennovar/googlecal.svg?branch=master\">\n<img\nsrc=\"https://badge.fury.io/rb/googlecal.svg\"> ...\n"],["Rakefile","","Rakefile.html","","<p>require “bundler/gem_tasks” require “rspec/core/rake_task”\n<p>RSpec::Core::RakeTask.new …\n"],["setup","","bin/setup.html","","<p>#!/usr/bin/env bash set -euo pipefail IFS=$&#39;nt&#39; set -vx\n<p>bundle install\n<p># Do any other automated …\n"],["client_secret.json","","client_secret_json.html","","<p>{“installed”:{“client_id”:“834007170511-ck15fpmltt5aih07pjnu4s5e46tlruj2.apps.googleusercontent.com”,“project_id”:“ferrous-plating-160900”,“auth_uri”:“https://accounts.google.com/o/oauth2/auth”,“token_uri”:“https://accounts.google.com/o/oauth2/token”,“auth_provider_x509_cert_url”:“https://www.googleapis.com/oauth2/v1/certs”,“client_secret”:“CQpf9VZ4yz9qD79Jb6W1Qfm5”,“redirect_uris”:\n…\n"],["googlecal.gemspec","","googlecal_gemspec.html","","<p>lib = File.expand_path(&#39;../lib&#39;, __FILE__) $LOAD_PATH.unshift(lib)\nunless $LOAD_PATH.include?(lib) …\n"]]}}