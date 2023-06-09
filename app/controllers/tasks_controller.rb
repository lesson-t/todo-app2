class TasksController < ApplicationController


    def show
        @task = Task.find(params[:id])
    end

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        if @task.save
            redirect_to board_task_path(@task.board, @task.id), notice: '保存できました'
        else
            flash.now[:error] = '保存に失敗しました'
            render :new
        end
    end

    def edit
        board = Board.find(params[:board_id])
        @task = board.tasks.find(params[:id])

    end

    def update
        board = Board.find(params[:board_id])
        @task = board.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to board_task_path(@task.board, @task.id), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    def destroy
        board = Board.find(params[:board_id])
        @task = board.tasks.find(params[:id])
        @task.destroy!
        redirect_to board_path(@task.board), notice: '削除に成功しました'
    end

    private
    def task_params
        params.require(:task).permit(:title, :content, :deadline, :eyecatch).merge(user_id:current_user.id)
    end

    def set_task
        @task = Task.find(params[:id])
    end

end