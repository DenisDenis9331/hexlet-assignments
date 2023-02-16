class BulletinsController < ApplicationController
  def index
    @bulletins = Bulletin.all.order(created_at: :desc)
  end

  def show
    @bulletin = Bulletin.find(params[:id])
  end
end
