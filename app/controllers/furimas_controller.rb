class FurimasController < ApplicationController
  def index
    @furimas = Furima.all
  end
end
