class TweetsController < ApplicationController
  def index
    render json: Tweet.all
  end

  def new
    render json: Tweet.new
  end

  def create
    begin
      tweet = Tweet.create(message: params[:message])
      render json: tweet, status: 200

    rescue ActiveRecord::StatementInvalid => error
      render json: { response: "Error occured: #{error.message}" }, status: :unprocessable_entity
    end
  end

  def show
    begin
      render json: Tweet.find(params[:id])

    rescue ActiveRecord::RecordNotFound => error
      render json: { response: "Error occured: #{error.message}" }, status: :unprocessable_entity
    end
  end

  def edit
    begin
      render json: Tweet.find(params[:id])

    rescue ActiveRecord::RecordNotFound => error
      render json: { response: "Error occured: #{error.message}" }, status: :unprocessable_entity
    end
  end

  def update
    begin
      tweet = Tweet.find(params[:id])
      tweet.message = params[:message]
      tweet.save
      render json: tweet, status: 200

    rescue ActiveRecord::StatementInvalid, ActiveRecord::RecordNotFound => error
      render json: { response: "Error occured: #{error.message}" }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      Tweet.destroy(params[:id])
      render json: { response: 'destroyed' }, status: 200

    rescue ActiveRecord::RecordNotFound => error
      render json: { response: "Error occured: #{error.message}" }, status: :unprocessable_entity
    end
  end

end
