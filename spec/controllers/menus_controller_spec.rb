require 'rails_helper'

RSpec.describe MenusController do

    # GET #Index
    describe 'GET #index' do
        context 'normal request to controller' do
            it "populates an array of all menus" do 
                nasi_uduk = FactoryBot.create(:menu, name: "Nasi Uduk")
                kerak_telor = FactoryBot.create(:menu, name: "Kerak Telor")
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
        it "assigns the requested menu to @menu" do
            nasi_uduk = FactoryBot.create(:menu, name: "Nasi Uduk")
            get :show, params: { id: nasi_uduk }
            expect(assigns(:menu)).to eq nasi_uduk
        end
    
        it "renders the :show template" do
            nasi_uduk = FactoryBot.create(:menu, name: "Nasi Uduk")
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
          it "saves the new menu in the database" do
            category1 = FactoryBot.create(:category, name: "Indonesian")
            category2 = FactoryBot.create(:category, name: "Italiano")
            expect{post :create, params: { menu: attributes_for(:menu), categories: [category1.id, category2.id] } }.to change(Menu, :count).by(1)
          end
    
          it "redirects to menus#show" do
            category1 = FactoryBot.create(:category, name: "Indonesian")
            category2 = FactoryBot.create(:category, name: "Italiano")
            post :create, params: { menu: attributes_for(:menu), categories: [category1.id, category2.id] }
            expect(response).to redirect_to(menu_path(assigns[:menu]))
          end
        end
        context "with invalid attributes" do
            it "does not save the new menu in the database" do
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

    # Patch
    describe 'PATCH #update' do
      before :each do
        @menu = create(:menu)
      end

      context "with valid attributes" do
        it "locates the requested @menu" do
          patch :update, params: { id: @menu, menu: attributes_for(:menu) }
          expect(assigns(:menu)).to eq @menu
        end
  
        it "changes @menu's attributes" do
          patch :update, params: { id: @menu, menu: attributes_for(:menu, name: 'Nasi Goreng') }
          @menu.reload
          expect(@menu.name).to eq('Nasi Goreng')
        end
  
        it "redirects to the menu" do
          patch :update, params: { id: @menu, menu: attributes_for(:menu) }
          expect(response).to redirect_to @menu
        end
      end

      context 'with invalid attributes' do
        it 'does not save the updated menu in the database' do
          patch :update, params: { id: @menu, menu: attributes_for(:invalid_menu, name: 'Nasi Goreng', price: "Test") }
          expect(@menu.name).not_to eq('Nasi Goreng')
        end
  
        it 're-renders the edit template' do
          patch :update, params: { id: @menu, menu: attributes_for(:invalid_menu) }
          expect(assigns(:menu)).to eq @menu
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    # Delete
    describe 'DELETE #destroy' do
      before :each do
        @menu = create(:menu)
      end
  
      it "deletes the menu from the database" do
        expect{
          delete :destroy, params: { id: @menu }
        }.to change(Menu, :count).by(-1)
      end
  
      it "redirects to menus#index" do
        delete :destroy, params: { id: @menu }
        expect(response).to redirect_to menus_url
      end
    end
end