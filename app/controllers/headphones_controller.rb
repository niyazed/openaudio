class HeadphonesController < ApplicationController
    before_action :find_headphone, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:edit, :new ]

    def index
        if params[:category].blank?
            @headphones = Headphone.all.order("created_at DESC")
        else
            @category_id = Category.find_by(name: params[:category]).id
            @headphones = Headphone.where(:category_id => @category_id).order("created_at DESC")
        end
    end

    def show
    end

    def new
        @headphone = current_user.headphones.build
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end

    def create
        @headphone = current_user.headphones.build(headphone_params)
        @headphone.category_id = params[:category_id]
        if @headphone.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
        @categories = Category.all.map{ |c| [c.name, c.id]}
    end

    def update
        @headphone.category_id = params[:category_id]
        if @headphone.update(headphone_params)
            redirect_to headphone_path(@headphone)
        else
            render 'edit'
        end
    end

    def destroy
        @headphone.destroy
        redirect_to root_path
    end


    private

        def headphone_params
            params.require(:headphone).permit(:model, :description, :brand, :price, :rent, :category_id, :image)
        end

        def find_headphone
            @headphone = Headphone.find(params[:id])
        end
end
