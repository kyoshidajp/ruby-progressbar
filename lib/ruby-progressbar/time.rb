class   ProgressBar
class   Time
  def self.now(time = ::Time)
    @time = time

    @time.__send__ unmocked_time_method
  end

  def self.unmocked_time_method
    @unmocked_time_method ||= begin
                                time_mocking_library_methods.find do |method|
                                  @time.respond_to? method
                                end
                              end
  end

  def self.time_mocking_library_methods
    [
      :__simple_stub__now,          # ActiveSupport
      :now_without_mock_time,       # Timecop
      :now_without_delorean,        # Delorean
      :now                          # Actual
    ]
  end
end
end
