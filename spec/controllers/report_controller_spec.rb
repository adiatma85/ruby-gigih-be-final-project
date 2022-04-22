require 'rails_helper'

RSpec.describe ReportController do

    #Get By email
    context 'normal request to controller (by_email)' do
        it "renders the :by_email template" do
            get :by_email
            expect(response).to render_template :by_email
        end
    end

    # Get By detail email
    context 'normal request to controller (by_detail_email)' do
        it "renders the :by_detail_email template (zero data)" do
            get :by_detail_email
            expect(response).to render_template :by_detail_email
        end

        it "renders the :by_detail_email template with param" do
            order1 =  FactoryBot.create(:order, email: "adiatma85@gmail.com")
            order2 =  FactoryBot.create(:order, email: "adiatma86@gmail.com")
            get :by_detail_email, params: { email: order1.email }
            expect(assigns(:orders)).to match_array([order1])
            expect(response).to render_template :by_detail_email
        end
    end

    #Get By value
    context 'normal request to controller (by_value)' do
        it "renders the :by_value template" do
            get :by_value
            expect(response).to render_template :by_value
        end
    end

    # Get By detail value
    context 'normal request to controller (by_detail_value)' do
        it "renders the :by_detail_value template (zero data)" do
            get :by_detail_value
            expect(response).to render_template :by_detail_value
        end

        it "renders the :by_detail_email template with param" do
            order1 =  FactoryBot.create(:order, email: "adiatma85@gmail.com", total: 1000000)
            order2 =  FactoryBot.create(:order, email: "adiatma86@gmail.com", total: 400000)
            get :by_detail_value, params: { value: (order1.total - order2.total) }
            expect(assigns(:orders)).to match_array([order1])
            expect(response).to render_template :by_detail_value
        end
    end

    #Get By date
    context 'normal request to controller (by_date)' do
        it "renders the :by_date template" do
            get :by_date
            expect(response).to render_template :by_date
        end
    end

    # Get By detail date
    context 'normal request to controller (by_detail_date)' do
        it "renders the :by_detail_date template (zero data)" do
            get :by_detail_date
            expect(response).to render_template :by_detail_date
        end

        it "renders the :by_detail_email template with param" do
            order1 =  FactoryBot.create(:order, email: "adiatma85@gmail.com", created_at: 1.day.ago)
            order2 =  FactoryBot.create(:order, email: "adiatma86@gmail.com", created_at: 2.week.ago)
            get :by_detail_date, params: { date_start: Date.yesterday.strftime("%Y%m%d"), date_end: Date.tomorrow.strftime("%Y%m%d") }
            expect(assigns(:orders)).to match_array([])
            expect(response).to render_template :by_detail_date
        end
    end
end