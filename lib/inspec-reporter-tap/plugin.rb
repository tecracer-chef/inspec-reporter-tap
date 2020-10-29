require_relative "version"

module InspecPlugins
  module TapReporter
    class Plugin < ::Inspec.plugin(2)
      # Internal machine name of the plugin. InSpec will use this in errors, etc.
      plugin_name :"inspec-reporter-tap"

      reporter :tap do
        require_relative "reporter"
        InspecPlugins::TapReporter::Reporter
      end

      reporter :tap13 do
        require_relative "reporter13"
        InspecPlugins::TapReporter::Reporter13
      end
    end
  end
end
