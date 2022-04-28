class SpicesController < ApplicationController
    before_action :find_spice, only: [:destroy, :update]
    # rescue_from ActiveRecord::RecordNotFound, with: :render_error

    def index
        render json: Spice.all, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        # spice = find_spice
        @spice.update(spice_params)
        render json: @spice, status: :accepted
    end

    def destroy
        # spice = find_spice
        @spice.destroy
        render json: {}
    end

    private 

    def spice_params
        params.permit(:title, :image, :description, :rating, :notes)
    end

    def find_spice
        @spice = Spice.find(params[:id])
    end
    
    # def render_error
    #     render json: { error: "not found" }, status: :not_found
    # end
end
