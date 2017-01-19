module ClientHelper extend self
                    def generate_token(length = 690)
                      range = [*'0'..'9', *'A'..'Z', *'a'..'z']
                      Array.new(length) { range.sample }.join
                    end
end
