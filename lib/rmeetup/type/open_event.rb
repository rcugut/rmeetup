module RMeetup
  module Type
    
    # == RMeetup::Type::Event
    #
    # Data wraper for a Event fethcing response
    # Used to access result attributes as well
    # as progammatically fetch relative data types
    # based on this event.
    
    # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
    # See http://www.meetup.com/meetup_api/docs/events/ for available fields
    
    class OpenEvent
      
      attr_accessor :event
      
      def initialize(event = {})
        self.event = event
      end
      
      def method_missing(id, *args)
        return self.event[id.id2name]
      end
      
      # Special accessors that need typecasting or other parsing
      def lat
        self.event['lat'].to_f
      end
      def lon
        self.event['lon'].to_f
      end
      def rsvpcount
        self.event['rsvpcount'].to_i
      end
      def updated
	Time.at(self.event['updated'].to_i/1000).to_datetime
      end
      def time
	Time.at(self.event['time'].to_i/1000).to_datetime
      end
    end
  end
end
