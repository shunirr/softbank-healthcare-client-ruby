# -*- coding: utf-8 -*-

require 'faraday'
require 'json'
require 'date'
require 'faraday-cookie_jar'

module SoftBankHealthCare
  class ApiClient
    def initialize
      @conn = Faraday.new(:url => 'https://healthcare.mb.softbank.jp') do |faraday|
        faraday.request :url_encoded
        faraday.use :cookie_jar
        faraday.adapter Faraday.default_adapter
      end
    end

    def login(params = {})
      res = @conn.post '/v3/web_login', {
        user_id:       1,
        telno:         params[:telno],
        passwd:        params[:password]
      }
      res.body.include? '/pc/web/assets/home/home.php'
    end

    def home_summary(date = Date.today)
      res = @conn.get do |req|
        req.url '/v3/web_api_get_home_summary'
        req.params[:date] = date.strftime('%Y%m%d')
      end
      begin
        JSON.parse res.body
      rescue => e
        res.body
      end
    end
  end
end

