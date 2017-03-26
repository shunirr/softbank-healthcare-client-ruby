# -*- coding: utf-8 -*-

module SoftBankHealthCare
  class Client
    def initialize(params)
      @api = ApiClient.new
      @api.login params
      refresh
    end

    def date=(v)
      refresh v
    end

    def refresh(date = Date.today)
      @summary = @api.home_summary(date)['root']
    end

    def weight
      @summary['weight']
    end

    def body_fat
      @summary['bodyfat']
    end

    def bmi
      @summary['bmi']
    end

    def basal_metabolism
      @summary['bmr']
    end

    def physical_age
      @summary['bodyage']
    end

    def skeletal_muscle_level
      @summary['muscle']
    end

    def bone_level
      @summary['bone']
    end

    def visceral_fat_level
      @summary['visceralfat']
    end

    def water_content
      @summary['tbw']
    end
  end
end
