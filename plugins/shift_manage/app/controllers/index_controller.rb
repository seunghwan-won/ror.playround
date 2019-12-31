class IndexController < ApplicationController

  def check_in
    @testData = "hello redmine"
  end

  def time_log
    @time = Time.current
  end
end
