module Api
    module V1
        class AtweetsController < V1Controller
            http_basic_authenticate_with name: "dhh", password: "secret", only: :create
            skip_before_action :verify_authenticity_token
        

            def news 
                @tweets = Tweet.all.order('created_at DESC').limit(50)
                render json: @tweets.to_json(methods: [:likes_count, :retweets_count], except: [:created_at, :updated_at])
            end

            def by_date
                @tweets = Tweet.created_between(params[:fecha1], params[:fecha2])
                render json: @tweets
            end

            def create 
                @tweet = Tweet.create(content: params[:content], user_id: params[:user_id])
                @tweet.save!
            end
        end
    end
end 