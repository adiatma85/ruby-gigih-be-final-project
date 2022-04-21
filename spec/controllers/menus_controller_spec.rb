require 'rails_helper'

RSpec.describe MenusController do

    # GET #Index
    describe 'GET #index' do
        context 'normal request to controller' do
            it "populates an array of all menus" do 
                nasi_uduk = Menu.create(
                    name: 'Nasi Uduk',
                    description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
                    price: 15000.0
                )
                kerak_telor = Menu.create(
                    name: 'Kerak Telor',
                    description: 'Kerak Telor yang enak',
                    price: 15000.0
                )
                get :index
                expect(assigns(:menus)).to match_array([nasi_uduk, kerak_telor])
            end

            it "renders the :index template" do
                get :index
                expect(response).to render_template :index
            end
        end
    end

    # GET #Show
    describe 'GET #show' do
        it "assigns the requested food to @food" do
            nasi_uduk = Menu.create(
                name: 'Nasi Uduk',
                description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
                price: 15000.0
            )
            get :show, params: { id: nasi_uduk }
            expect(assigns(:menu)).to eq nasi_uduk
        end
    
        it "renders the :show template" do
            nasi_uduk = Menu.create(
                name: 'Nasi Uduk',
                description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
                price: 15000.0
            )
            get :show, params: { id: nasi_uduk }
            expect(response).to render_template :show
        end
    end

    # GET #New
    describe 'GET #new' do
        it "assigns a new Menu to @menu" do
            get :new
            expect(assigns(:menu)).to be_a_new(Menu)
        end
    
        it "renders the :new template" do
          get :new
          expect(:response).to render_template :new
        end
    end

    # GET #Edit
    describe 'GET #edit' do
        it "assigns the requested menu to @menu" do
          menu = create(:menu)
          get :edit, params: { id: menu }
          expect(assigns(:menu)).to eq menu
        end
    
        it "renders the :edit template" do
          menu = create(:menu)
          get :edit, params: { id: menu }
          expect(response).to render_template :edit
        end
    end

    # POST #Create
    describe 'POST #create' do
        context "with valid attributes" do
          it "saves the new food in the database" do
            expect{
              post :create, params: { menu: attributes_for(:menu) }
            }.to change(Menu, :count).by(1)
          end
    
          it "redirects to foods#show" do
            post :create, params: { menu: attributes_for(:menu) }
            expect(response).to redirect_to(menu_path(assigns[:menu]))
          end
        end
        context "with invalid attributes" do
            it "does not save the new food in the database" do
              expect{
                post :create, params: { menu: attributes_for(:invalid_menu) }
              }.not_to change(Menu, :count)
            end
      
            it "re-renders the :new template" do
              post :create, params: { menu: attributes_for(:invalid_menu) }
              expect(response).to render_template :new
            end
        end
    end

    # Right now is refactoring

    # Patch

    # Delete
end