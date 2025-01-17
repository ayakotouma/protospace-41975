class PrototypesController < ApplicationController
  # 「authenticate_user!」でログインしていない人をログインページに遷移させる。
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit]

  def index
    @prototypes = Prototype.all  # すべてのプロトタイプを取得
  end

  def new
    # 新規投稿画面の表示用（処理はまだ書かない）
    @prototype = Prototype.new
  end

  def create
    # 投稿データの保存用（処理はまだ書かない）
    @prototype = Prototype.new(prototype_params)
    # 現在ログインしているユーザーを紐付け
    @prototype.user = current_user 
    if @prototype.save
      redirect_to root_path # 成功したらトップページへ
    else
      render :new, status: :unprocessable_entity# 失敗したら新規投稿ページに戻る
    end
  end
  
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      
      redirect_to prototype_path(@prototype)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  # ストロングパラメータ
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  def contributor_confirmation
    @prototype = Prototype.find(params[:id])
    # 投稿者以外だったらトップページに遷移する。残った投稿者のみが該当アクションに入れるようにする。
    redirect_to root_path unless current_user == @prototype.user
  end
end
