class ChickensController < ApplicationController
    def index
        chickens = Chicken.all
        render json: chickens
    end
  
    def create
        chicken = Chicken.create(chicken_params)
        if chicken.valid?
            render json: chicken
        else
            render json: chicken.errors, status: 422
        end
    end

    def update
        chicken = Chicken.find(params[:id])
        chicken.update(chicken_params)
        render json: chicken
    end

    def destroy
        chicken = Chicken.find(params[:id])
        chicken.destroy
        render json: chicken
    end

    private
    def chicken_params
        params.require(:chicken).permit(:name, :age, :enjoys)
    end

end
