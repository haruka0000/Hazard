class HomeController < ApplicationController

  # ユーザがログインしていないと"show"にアクセスできない
  before_action :authenticate_user!, only: :show

  def index
  end

  def show
    @evac = Evacuation.all
  end
end
