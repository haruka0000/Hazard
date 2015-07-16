class HomeController < ApplicationController

  # ユーザがログインしていないと"show"にアクセスできない
  before_action :authenticate_user!, only: :show

  def index
  end

  def show
    @evac = Evacuation.all
  end

  def search
    @evac = Evacuation.find_by(:evacuations => params[:id])
  end
end
