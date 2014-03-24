# -*- coding: utf-8 -*-

module HealthCare
  class Bodycomp
    attr_accessor :weight, :bodyfat, :number, :value, :level

    def initialize(data)
      @weight  = data['weight']  if data['weight']
      @bodyfat = data['bodyfat'] if data['bodyfat']
      @number  = data['number'].split(',').map{|m| m.to_f} if data['number']
      @value   = data['value'].split(',').map{|m| m.to_f}  if data['value']
      @level   = data['level'].split(',').map{|m| m.to_f}  if data['level']
    end

    def latest
      @value.reverse.each do |v|
        return v if v > 0
      end
      -1
    end
  end
end
