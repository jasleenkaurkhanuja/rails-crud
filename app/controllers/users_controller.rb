class UsersController < ApplicationController
  def csrf_token
    csrf_token = request.headers['X-CSRF-Token']
    # Your logic here
  end
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_now
      render json: @user, status: :created
    else
      render json: @user.erros.full_messages, status: :unprocessable_entity
    end
      
  end

  def update
    return render json: params
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json:@user, status: :updated
    else 
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # def welcome 
  #   @user = User.find(params[:id])
  #   UserMailer.with(user: @user).welcome_email.deliver_now

  #   respond_to do |format|
  #   format.html {redirect_to(users_path(@user), notice: 'User recieved the email')}
  #   format.json {render json: @user, status: :created}
  #   end
  # end
  # end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: @user 
    else 
      render json: errors.full_messages, status: :unprocessable_entity
    end
  end

end
private 
  def user_params 
    params.require(:user).permit(:name, :email)
  end

