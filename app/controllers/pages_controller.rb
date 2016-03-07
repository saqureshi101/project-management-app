class PagesController < ApplicationController
  def home
  end
  def about
  end

  def index
  	@to_do = current_user.projects.where(stage: "to_do")
    @doing = current_user.projects.where(stage: "doing")
    @done = current_user.projects.where(stage: "done")
  end

  def test
  end
end
