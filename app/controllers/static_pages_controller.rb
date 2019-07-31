# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @list = current_user.lists.build
      @lists = current_user.lists.all
    end
  end

  def help; end

  def about; end

  def contact; end
end
