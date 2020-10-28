require "erb"

module InspecPlugins::TapReporter
  class Reporter < Inspec.plugin(2, :reporter)
    TestResult = Struct.new(:index, :result, :description, :message, :severity, keyword_init: true) 

    attr_reader :template_erb

    def initialize(config)
      super(config)

      @template_erb = "tap.erb"
    end

    def render      
      tests = []
      run_data[:profiles].each do |profile|
        profile.controls.each do |control|
          control.results.each do |result|
            tests << TestResult.new(
              index: tests.count + 1,
              result: status_to_pass(result.status),
              description: control.title,
              message: format("%s %s", result.resource_name, result.expectation_message),
              severity: impact_to_severity(control.impact)
            )
          end
        end
      end

      passed_tests = tests.select { |data| data.result == "ok" }
      failed_tests = tests - passed_tests
      percent_ok = 100.0 * passed_tests.count / tests.count

      template_file = File.join(template_path, template_erb)
      template = ERB.new(File.read(template_file))

      output(template.result(binding))
    end

    def self.run_data_schema_constraints
      "~> 0.0"
    end

    private

    def template_path
      File.expand_path(__FILE__ + "../../../../templates")
    end

    def status_to_pass(inspec_status)
      case inspec_status
      when "passed", "skipped", "waived"
        "ok"
      else
        "not ok"
      end
    end

    # @see https://www.first.org/cvss/specification-document#Qualitative-Severity-Rating-Scale
    def impact_to_severity(inspec_severity)
      case inspec_severity
      when 0.0...0.1
        "none"
      when 0.1...0.4
        "low"
      when 0.4...0.7
        "medium"
      when 0.7...0.9
        "high"
      when 0.9..1.0
        "critical"
      else
        "unknown"
      end
    end
  end
end
