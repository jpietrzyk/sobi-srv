module ClientHelper extend self
                    def generate_token(length = 690)
                      require 'securerandom'
                      SecureRandom.hex(length / 2)
                    end
end
