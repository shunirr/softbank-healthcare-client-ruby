# -*- coding: utf-8 -*-

module HealthCare
  class Client
    def initialize(params)
      @api = ApiClient.new
      @api.login params
      refresh
    end

    def refresh
      @summary = @api.home_summary['root']
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
      @summary['viscerafal']
    end

    def water_content
      @summary['tbw']
    end
  end
end
