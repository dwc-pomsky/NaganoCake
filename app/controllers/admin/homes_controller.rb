class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    # @oders = Oder.all
  end
end
