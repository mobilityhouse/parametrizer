module Parametrizer
  module Parsers
    class CarIdentifierParser
      
      CAR_IDS = ['smart_3_7', 'smart_22', 'mercedes-benz_b_class', 'mercedes-benz_s_class', 'mercedes-benz_c_class']
      
      attr_accessor :car_identifier

      def initialize(request_params)
        @car_identifier = check_param( request_params['car_identifier'] )
      end
      
      private
      
      def check_param( param )
        CAR_IDS.include?( param ) ? param : nil 
      end
      
    end
  end
end