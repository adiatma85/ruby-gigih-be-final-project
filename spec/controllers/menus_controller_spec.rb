require 'rails_helper'

RSpec.describe MenusController do
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

            # it "renders the :index template" do
            #     get :index
            #     expect(response).to render_template :index
            # end
        end
    end
end