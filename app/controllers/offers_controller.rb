class OffersController < ApplicationController
    before_action :authentication_required
    before_action :find_offer, only: [:show, :edit, :update, :destroy]

    def index
        @offers = Offer.all.open
    end

    def new
        @offer = current_user.offers.build
    end

    def create
        # binding.pry
        @offer = current_user.offers.build(offer_params)
        # binding.pry
        if @offer.save
            # binding.pry
            redirect_to @offer            
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @offer.update(offer_params)
          redirect_to @offer 
        else
          render 'edit'
        end
      end


    def destroy
        @offer.delete
        redirect_to '/'
    end

    private

    def offer_params
        params.require(:offer).permit(:job_name, :price_offer, :due_date)
    end

    def find_offer
        @offer = Offer.find(params[:id])
    end

end
