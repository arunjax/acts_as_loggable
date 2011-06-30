require "acts_as_loggable/version"

module ActiveRecord #:nodoc:
  module ActsAsLoggable #:nodoc:
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def acts_as_loggable
        has_many :recent_activities, :as => :onobject, :dependent => :destroy, :order => 'recent_activities.id DESC'

        include ActiveRecord::ActsAsLoggable::InstanceMethods
      end

    end


    module InstanceMethods
      # Creates the recent activity record for the object.
      #
      # Compulsory Params:
      # =============
      # => user - Who creates this activity
      # => activity_type - Type of the activity[Integer]
      #
      # Optional Params:
      # =============
      # =>  disable_further_logging_for - Ex: 15.minutes, No more record creation for further 15 minutes. But will update the updated at, and created_at field to the current Time.
      #
      def create_recent_activity(options = {})
        user = options[:user]
        disable_period = options.delete(:disable_further_logging_for)
        if disable_period
          activity = self.recent_activities.last(:conditions => ["user_id = ? AND activity_type = ? AND created_at > ?", user.id, options[:activity_type], Time.now.utc - disable_period])
          if activity
            activity.destroy
          end
        end

        activity = RecentActivity.create(options)
        self.recent_activities << activity
        return activity
      end
    end
  end
end


ActiveRecord::Base.send(:include, ActiveRecord::ActsAsLoggable)
