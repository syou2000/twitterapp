class RelationshipsController < ApplicationController
  protect_from_forgery :except => [:index, :show, :create, :destroy]

  def index
    @relationships = Relationship.all
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def show
    @relationship = Relationship.find(user_id: params[:id])
    render 'show', formats: 'json', handlers: 'jbuilder'
  end

  def create
    Relationship.new
    Relationship.create(user_id: params[:user_id], follow_id: params[:follow_id])
    Notification.create(visitor_id: params[:user_id], visited_id: params[:follow_id], action: 'follow')
  end

  def destroy
    relationship = Relationship.find(params[:id])
    relationship.delete
  end
end
