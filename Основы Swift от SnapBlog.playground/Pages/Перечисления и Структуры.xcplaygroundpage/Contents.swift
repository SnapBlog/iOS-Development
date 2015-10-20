//: # Курс "Swift-Drift" от [SnapBlog](http://snapblog.ru)
//:
//: ## Перечисления и Структуры
//:
//: Классы не являются единственным способом определения типов данных в Swift. Перечисления и структуры имеют аналогичные возможности классов, но могут быть более полезными в различных случаях.
//:
//: _Перечисления_ определяют общий тип для группы связанных значений и позволяют работать с этими значениями в типобезопасном режиме в вашем коде. Перечисления могут иметь методы, связанные с ними.
//:
//: Используйте `enum` для создания перечисления.
//:
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

//: В приведенном выше примере, начальное значение (rawValue - “сырое” значение) перечисления является `Int`, так что вы должны указать только первое начальное значение. Остальные начальные значения присваиваются по порядку (мы указали для Ace = 1, далее Two будет равно 2, Three = 3 и т.д.). Вы также можете использовать строку или число с плавающей точной в качестве начального значения перечисления. Используйте свойство `rawValue` для доступа к начальному значению члена перечисления.
//:
//: Используйте `init?(rawValue:)` инициализатор, чтобы создать экземпляр перечисления из начального значения.
//:
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

//: Значения членов перечисления являются фактическими значениями, а не еще одним способом записи их начальных значений. В самом деле, в тех случаях, когда нет смысла в начальном значении, вы не должны его предоставлять.
//:
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

//: Обратите внимание на два пути обращения к члену перечисления `Hearts`: когда значение присваивается константе `hearts`, обращение (ссылка) к члену перечисления `Suit.Hearts` осуществляется по полному имени, потому что константа не имеет явно указанного типа. Внутри switch, обращение к члену перечисления осуществляется в сокровенной форме `.Hearts`, потому что `self` значение уже известно. Вы можете использовать сокращенную форму в любое время, когда известен тип значения.
//:
//: _Структуры_ очень похожи на классы, включая методы и инициализаторы. Одно из наиболее важных различий между структурами и классами это то, что структуры всегда копируются, если они где-то передаются в вашем коде, а передача классов осуществляется по ссылке (они не копируются). Структуры отлично подходят для определения легких типов данных, которым не нужны такие возможности, как наследование и приведение типов.
//:
//: Используйте `struct` для создания структуры. 
//:
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//: 
//:
//: [Назад](@previous) | [Далее](@next)
//:
//: [SnapBlog](http://snapblog.ru)
