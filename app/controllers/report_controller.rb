class ReportController < ApplicationController

    # By email
    def by_email
    end

    # detail email
    def by_detail_email
        query_email = params[:email]

        @orders = Order.where(email: query_email)
    end

    # By Date
    def by_date
    end

    # detail date
    def by_detail_date
        query_date_begin = params[:date_begin]
        query_date_end = params[:date_end]

        @orders = Order.where("created_at > ?", query_date_begin).where("created_at <= ? ", query_date_end)
    end

    # By value
    def by_value
    end

    # detail value
    def by_detail_value
        query_value = params[:value].to_f

        @orders = Order.where(total: query_value..)
    end
end
