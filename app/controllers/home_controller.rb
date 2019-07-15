class HomeController < ApplicationController
  def index
    @sections = Event.current.sections.order(:position) #Section.where(status: 'active')
    @classes = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  end
end
