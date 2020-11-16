class ProjectsController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: :dashboard
  def index
  end

  def dashboard
    if params[:state].present?
      @projects=Project.where('state = ?', params[:state])
      # @project=Project.where(states:params[:states]).all
    else
      @projects = Project.all
    end
  end

  def create
    @project = Project.create(name: params[:name], 
      description: params[:description], 
      start_on: params[:start_on], 
      finish_on: params[:finish_on], 
      state: params[:state])
      @project.save
  end
end
