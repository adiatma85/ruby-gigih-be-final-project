class MenusController < ApplicationController
    before_action :set_menu, only: %i[ show edit update destroy ]

    # Get /menus
    def index
        @menus = Menu.all
    end

    # Get /menus/1
    def show
    end

    # Get /menus/new
    def new
        @menu = Menu.new
    end

    # Get /menus/1/edit
    def edit
    end

    # Post /menus
    def create
        @menu = Menu.new(menu_params)

        respond_to do |format|
            if @menu.save
                format.html { redirect_to menu_url(@menu), notice: "Menu was successfully created." }
                format.json { render :show, status: :created, location: @menu }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @menu.errors, status: :unprocessable_entity }
            end
        end
    end

    # Patch/Put /menus/1
    def update
        respond_to do |format|
            if @menu.update(menu_params)
                format.html { redirect_to menu_url(@menu), notice: "Menu was successfully updated." }
                format.json { render :show, status: :ok, location: @menu }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @menu.errors, status: :unprocessable_entity }
            end
        end
    end

    # Delete /menus/1
    def destroy
        @menu.destroy

        respond_to do |format|
            format.html { redirect_to menus_url, notice: "Menu was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    # Helper function to set menu
    def set_menu
        @menu = Menu.find(params[:id])
    end

    # Helper function to return params
    def menu_params
        params.require(:menu).permit(:name, :description, :price)
    end
end