require 'rails_helper'
RSpec.describe OrdersController do
    # GET #Index
    describe 'GET #index' do
        context 'normal request to controller' do
            it "populates an array of all orders" do 
                order1 = FactoryBot.create(:order, email: "example@example.com")
                
                order2 = FactoryBot.create(:order, email: "random@example.com")
                get :index
                expect(assigns(:orders)).to match_array([order1, order2])
            end

            it "renders the :index template" do
                get :index
                expect(response).to render_template :index
            end
        end
    end

    # GET #Show
    describe 'GET #show' do
        it "assigns the requested order to @order" do
            order = FactoryBot.create(:order)
            get :show, params: { id: order }
            expect(assigns(:order)).to eq order
        end
    
        it "renders the :show template" do
            order = FactoryBot.create(:order)
            get :show, params: { id: order }
            expect(response).to render_template :show
        end
    end

    # GET #New
    describe 'GET #new' do
        it "assigns a new Order to @order" do
            get :new
            expect(assigns(:order)).to be_a_new(Order)
        end
    
        it "renders the :new template" do
          get :new
          expect(:response).to render_template :new
        end
    end

    # GET #Edit
    describe 'GET #edit' do
        it "assigns a new Order to @order" do
          order = create(:order)
          get :edit, params: { id: order }
          expect(assigns(:order)).to eq order
        end
    
        it "renders the :edit template" do
          order = create(:order)
          get :edit, params: { id: order }
          expect(response).to render_template :edit
        end
    end

    # POST #Create
    describe 'POST #create' do
      before :each do
        @nasi_uduk = FactoryBot.create(:menu, name: "Nasi Uduk")
        @kerak_telor = FactoryBot.create(:menu, name: "Kerak Telor")
        @random_menu_qty = [1, 2]
      end
        context "with valid attributes" do
          it "saves the new order in the database" do
            expect{
              post :create, params: { order: attributes_for(:order), menus: [@nasi_uduk, @kerak_telor], menu_qty: @random_menu_qty }
            }.to change(Order, :count).by(1)
          end
    
          it "redirects to orders#show" do
            post :create, params: { order: attributes_for(:order), menus: [@nasi_uduk, @kerak_telor],  menu_qty: @random_menu_qty }
            expect(response).to redirect_to(order_path(assigns[:order]))
          end
        end
        context "with invalid attributes (email is not valid as regex)" do
            it "does not save the new order in the database" do
              expect{
                post :create, params: { order: attributes_for(:invalid_order_with_invalid_email), menus: [@nasi_uduk, @kerak_telor],  menu_qty: @random_menu_qty }
              }.not_to change(Order, :count)
            end
      
            it "re-renders the :new template" do
              post :create, params: { order: attributes_for(:invalid_order_with_invalid_email), menus: [@nasi_uduk, @kerak_telor],  menu_qty: @random_menu_qty }
              expect(response).to render_template :new
            end
        end
        context "with invalid attributes email is nil" do
            it "does not save the new order in the database" do
              expect{
                post :create, params: { order: attributes_for(:invalid_order_with_nil), menus: [@nasi_uduk, @kerak_telor],  menu_qty: @random_menu_qty }
              }.not_to change(Order, :count)
            end
      
            it "re-renders the :new template" do
              post :create, params: { order: attributes_for(:invalid_order_with_nil), menus: [@nasi_uduk, @kerak_telor],  menu_qty: @random_menu_qty }
              expect(response).to render_template :new
            end
        end
    end

    # Patch
    describe 'PATCH #update' do
        before :each do
          @order = create(:order)
        end
  
        context "with valid attributes" do
          it "locates the requested @order" do
            patch :update, params: { id: @order, order: attributes_for(:order) }
            expect(assigns(:order)).to eq @order
          end
    
          it "changes @order's attributes" do
            patch :update, params: { id: @order, order: attributes_for(:order, email: "example@example.com") }
            @order.reload
            expect(@order.email).to eq('example@example.com')
          end
    
          it "redirects to the order" do
            patch :update, params: { id: @order, order: attributes_for(:order) }
            expect(response).to redirect_to @order
          end
        end
  
        context 'with invalid attributes' do
          it 'does not save the updated order in the database' do
            patch :update, params: { id: @order, order: attributes_for(:invalid_order_with_nil) }
            expect(@order.email).not_to eq(nil)
          end
    
          it 're-renders the edit template' do
            patch :update, params: { id: @order, order: attributes_for(:invalid_order_with_nil) }
            expect(assigns(:order)).to eq @order
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
    end

    # Delete
    describe 'DELETE #destroy' do
        before :each do
          @order = create(:order)
        end
    
        it "deletes the order from the database" do
          expect{
            delete :destroy, params: { id: @order }
          }.to change(Order, :count).by(-1)
        end
    
        it "redirects to orders#index" do
          delete :destroy, params: { id: @order }
          expect(response).to redirect_to orders_url
        end
      end
end