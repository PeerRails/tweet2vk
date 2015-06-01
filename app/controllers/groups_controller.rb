class GroupsController < ApplicationController
  before_filter :auth

  def list

    list = vklient.groups.get(user_id: vku.uid, extended: 1, count: 1000)
    render json: list.drop(1)

  end

  def info
    gid = groups_params[:gid]
    info = vklient.groups.getById(groud_id: gid, extended: 1)
    render json: info
  end

  def wall
    gid = groups_params[:oid]
    wall = vklient.wall.get(owner_id: "-#{oid}")
    render json: wall
  end

  def wall_post
    pid = groups_params[:mid]
    gid = groups_params[:gid]
    message = vklient.wall.getById(posts: "-#{gid}-#{mid}")
    render json: message
  end

  def groups_params
    params.permit(:gid, :oid, :pid, :wid)
  end

end
