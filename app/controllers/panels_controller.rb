require 'scalarm/database/model'
require 'scalarm/database/core'

class PanelsController < ApplicationController

  PREFIX = '/'

  def index

    # TODO: security

     @prefix = params[:base_url] || PREFIX

     panels = Panels.new
     @methods = panels.methods
     @groups = panels.groups

     experiment_id = params[:id].to_s

     @experiment = Scalarm::Database::Model::Experiment.find_by_id(experiment_id)
     if @experiment.nil?
       raise 'No experiment'
     end

    # #params = @experiment.get_parameter_ids controler or model?
    render :index, :layout => false
  end

  def show

  end
end
