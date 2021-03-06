module Rapporteur
  module Checks
    class ActiveRecordCheck
      def self.call(checker)
        ActiveRecord::Base.connection.execute("SELECT current_time AS time").first.fetch('time')
      rescue
        checker.add_error(:database, :unavailable)
      end
    end
  end
end
