class GroupsController < ApplicationController
	def index
    #flash[:notice] = "早安！你好！"
    #flash[:warning] = "這是 warning 訊息！"
    @groups = Group.all
	end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id]);
  end

  def create
    @group = Group.create(group_params)

    if @group.save
      redirect_to groups_path, notice: '新增討論板成功'
    else 
      flash[:alert] = "Title欄位沒有填"
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path, notice: "修改討論版成功"
    else
      flash[:alert] = "Title欄位沒有填"
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, alert: "討論板已刪除"
  end
end
private
  
  def group_params 
    params.require(:group).permit(:title, :description)
  end
