class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_presentable_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_presentable_string
  end

  def create
    name = params[:name]
    email = params[:email]
    pwd = params[:password]

    saved = User.create!({
      :name => name,
      :email => email,
      :password => pwd,
    })
    render plain: "User #{saved.to_presentable_string} has been saved successfully."
  end

  def update
    id = params[:id]

    name = params[:name]
    email = params[:email]
    pwd = params[:password]

    # Get the user from the DB.
    user = User.find(id)

    if name
      user.name = name
    end

    if email
      user.email = email
    end

    if pwd
      user.password = pwd
    end

    user.save!

    render plain: user.to_presentable_string
  end

  def login
    email = params[:email]
    pwd = params[:password]

    render plain: User.where(email: email, password: pwd).exists?
  end

  def delete
  end
end
