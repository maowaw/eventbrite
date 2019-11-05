class StaticPagesController < ApplicationController

#pour n'autoriser que les users à aller sur la page secrète :
	before_action :authenticate_user!, only: [:secret]

  def index
  end

  def secret
  end
end
