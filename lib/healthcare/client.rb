# -*- coding: utf-8 -*-

require 'faraday'
require 'json'
require 'date'

module HealthCare
  class Client
    def initialize
      @conn = Faraday.new(:url => 'https://healthcare.mb.softbank.jp') do |faraday|
        faraday.request :url_encoded
        faraday.adapter :net_http
      end
    end

    def login(params = {})
      res = @conn.post '/pc/assets/dispatcher/Register.php', {
        userid:        1,
        register_type: 3,
        api_pattern:   'web_login.php',
        telno:         params[:telno],
        passwd:        params[:password]
      }
      @cookie = res.headers['set-cookie']

      res.headers['location'].include? '../home/home.php'
    end

    def user_data
      get get_type: 11, api_pattern: 'get_user_data.php'
    end

    def present_top
      get get_type: 10, api_pattern: 'get_present_top.php'
    end

    def url_master_1
      get get_type: 12, api_pattern: 'get_url_master.php', view_url: 1
    end

    def url_master_2
      get get_type: 12, api_pattern: 'get_url_master.php', view_url: 2
    end

    def home_summary(date = Date.today)
      get get_type: 0, api_pattern: 'get_home_summary.php', date: date.strftime('%Y%m%d')
    end

    def information(last_update_time = Time.new)
      get get_type: 6, api_pattern: 'get_information.php', last_update_time: last_update_time.strftime('%Y%m%d%H%M')
    end

    def friend_requested_list(params = {})
      get(
        get_type:         5,
        api_pattern:      'friend_requested_list.php',
        page:             params[:page]             || 0,
        get_uncheck_mode: params[:get_uncheck_mode] || 0
      )
    end

    def current_goal
      get get_type: 1, api_pattern: 'get_current_goal.php'
    end

    def friend_list
      get get_type: 5, api_pattern: 'friend_list.php'
    end

    def balance
      get get_type: 3, api_pattern: 'get_balance.php'
    end

    def mg_steps_weight
      get get_type: 0, api_pattern: 'get_mg_steps_weight.php'
    end

    def ac_steps
      get get_type: 0, api_pattern: 'get_ac_steps.php'
    end

    def event
      get get_type: 9, api_pattern: 'get_event.php'
    end

    def bmr(params = {})
      bodycomp :bmr, params
    end

    def bodyage(params = {})
      bodycomp :bodyage, params
    end

    def muscle(params = {})
      bodycomp :muscle, params
    end

    def bone(params = {})
      bodycomp :bone, params
    end

    def visceralfat_lv(params = {})
      bodycomp :visceralfat_lv, params
    end

    def tbw(params = {})
      bodycomp :tbw, params
    end

    def bodycomp(type = :bmr, params = {})
      get(
        get_type:    14,
        api_pattern: 'get_ac_bodycomp.php',
        str_date:    params[:str_date] || Date.today.strftime('%Y%m%d'),
        end_date:    params[:end_date] || '',
        type:        type.to_s
      )
    end

    private
    def get(params = {})
      res = @conn.get do |req|
        req.url '/pc/assets/dispatcher/Dispatcher.php' 
        req.headers['cookie'] = @cookie
        req.params[:dispatcher_type] = 0
        req.params.merge! params
      end
      begin
        JSON.parse res.body
      rescue => e
        res.body
      end
    end
  end
end

