class TasksController < ApplicationController

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(board_params)
        if @task.save
            redirect_to task_path(@task), notice: '保存できました'
        else
            flash.now[:error] = '保存に失敗しました'
            render :new
        end
    end

    def edit
        @task = current_user.tasks.find(params[:id])
    end

    def update
        @task = current_user.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to task_path(@task), notice: '更新できました'
        else
            flash.now[:error] = '更新に失敗しました'
            render :edit
        end
    end

    def destroy
        task = current_user.tasks.find(params[:id])
        task.destroy!
        redirect_to root_path, notice: '削除に成功しました' #タスクが追加されているボードに戻したい
    end

    private
    def task_params
        params.require(:task).permit(:title, :content, :deadline)
    end

    def set_task
        @task = Task.find(params[:id])
    end

end