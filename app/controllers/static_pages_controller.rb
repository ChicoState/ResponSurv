class StaticPagesController < ApplicationController
  include StaticPagesHelper

  def survey
    view
  end
end
