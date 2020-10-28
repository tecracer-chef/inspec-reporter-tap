require_relative "reporter"

module InspecPlugins::TapReporter
  class Reporter13 < Reporter
    def initialize(config)
      super(config)

      @template_erb = "tap13.erb"
    end
  end
end
