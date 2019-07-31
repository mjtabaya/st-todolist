# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy update]
  before_action :correct_user,   only: :destroy

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'Task created!'
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'Task deleted'
    redirect_to request.referrer || root_url
  end

  private

  def task_params
    params.require(:task).permit(:list_Id, :content)
  end

  def correct_user
    redirect_to root_url if @atsks.nil? || current_user != @atsk.list.user
  end
end
