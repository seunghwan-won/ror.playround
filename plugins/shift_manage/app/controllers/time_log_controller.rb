class TimeLogController < ApplicationController
  def index
    @times = Attendances.all
  end
  def create
    time = Attendances.new
    time.check_in_time = Time.current
    time.save
    #redirect_to :action => 'index'
  end

  def delete
    Attendances.last.delete
    #redirect_to :action => 'index'
  end

  def update
    time = Attendances.first
    time.check_in_time = Time.current
    time.save
    #redirect_to :action => 'index'
  end
end
