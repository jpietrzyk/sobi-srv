module ClientHelper extend self
                    def generate_token(length = 690)
                      require 'securerandom'
                      SecureRandom.hex(345)
                    end
end
