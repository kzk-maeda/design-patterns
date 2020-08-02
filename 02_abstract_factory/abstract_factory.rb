# Abstract Factory
class DinnerFactory
    def initialize
    end

    def createDinner
        return [createAppetizer, createMain]
    end

    def createMain
    end

    def createAppetizer
    end
end

class Rice
    def initialize
    end
end

class Soup
    def initialize
    end
end

class Pizza
    def initialize
    end
end

class Salad
    def initialize
    end
end

# Concrete Factory
class JapaneseFactory < DinnerFactory
    def createMain
        Rice.new
    end
    def createAppetizer
        Soup.new
    end
end

class ItalyFactory < DinnerFactory
    def createMain
        Pizza.new
    end
    def createAppetizer
        Salad.new
    end
end

japanese_f = JapaneseFactory.new
print japanese_f.createDinner
print '\n'

italy_f = ItalyFactory.new
print italy_f.createDinner
print '\n'

# プログラム内でjapaneses_fとitaly_fを入れ替える必要があった場合、
# 必要なメソッドはポリモーフィズムにより共通化され、代入されている
# オブジェクトも意識する必要がないので、容易に入れ替えが可能

# テスト用のモック差込などに使えそう