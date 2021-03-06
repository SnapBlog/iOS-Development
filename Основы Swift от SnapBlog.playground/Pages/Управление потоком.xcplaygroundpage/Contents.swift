//: # Курс "Swift-Drift" от [SnapBlog](http://snapblog.ru)
//:
//: ## Управление потоком
//:
//: В Swift есть два типа операторов управления потоком. _Условные операторы_, такие как `if` и `switch`, которые проверяют истинно-ли условие, т.е. проверяют равна-ли Boolean-переменная значению `true`, до выполнения следующего после условия кода. _Циклы_ (_Loops_), такие как `for`-`in` и `while`, которые могут выполнять один и тот-же кусок кода несколько раз. 
//:
//: Оператор `if` проверят, является ли некоторое условие истиной, и если это так, то выполняется код, указанный внутри цикла `if`. Вы можете добавить оператор (ответвление) `else` в цикл `if`, если нужно добавить дополнительную логику в ваш код.
//:
let number = 25
if number < 10 {
    print("The number is small")
} else if number > 100 {
    print("The number is pretty big")
} else {
    print("The number is between 10 and 100")
}

//: > **Эксперимент**:
//: > Измените значение `number` на другое целое число, чтобы увидеть, как это влияет на выбор строки, которая будет выведена на экран.
//:
//: Циклы могут быть вложенными. Вот пример цикла `if` с ответвлением `else`, заключенных внутри `for`-`in` цикла (который перебирает каждый элемент в массиве, один за другим).
//:
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//: Используйте _optional binding_ в `if` цикле, чтобы проверить, содержит ли опциональная переменная какое-либо значение.
//:
var optionalName: String? = "Rustam Idrisov"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

//: > **Эксперимент**:
//: > Измените значение `optionalName` на `nil`. Какое приветствие вы увидите? Добавьте `else`, чтобы установить приветствие (на ваш выбор), в том случае, если `optionalName` равно `nil`.
//:
//: Если опциональное значение равно `nil`, то условие условие считается равным `false`, и код находящийся в фигурных скобках пропускается. В противном случае, опциональное значение разворачивается и назначается константе, указанной после оператора `let`, что делает развернутое значение доступным внутри блока кода (внутри `if`).
//:
//: Вы можете использовать один оператор `if`, чтобы связать несколько условий. Оператор `where` может быть добавлен в связку с `if` для того, чтобы более детально развернуть условие. В такой связке, оператор `if` выполнит код в фигурных скобках только тогда, когда все развертывания (binding) пройдут успешно для всех опциональных значений, при всех условиях.
//:
var optionalHello: String? = "Hello"
if let hello = optionalHello where hello.hasPrefix("H"), let name = optionalName {
    greeting = "\(hello), \(name)"
}

//: Переключения (switches) в Swift являются достаточно мощными. Оператор `switch` поддерживает любой тип данных и широкий спектр операций сравнения - он не ограничивается целыми числами и проверкой на равенство. В данном примере, оператор `switch` переключается на значение строки `vegetable`, сравнивая все значения с каждым из вариантов и выполняет тот, которому соответствует значение `vegetable`.
//:
let vegetable = "red pepper"
switch vegetable {
    case "celery":
        let vegetableComment = "Add some raisins and make ants on a log."
    case "cucumber", "watercress":
        let vegetableComment = "That would make a good tea sandwich."
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(x)?"
    default:
        let vegetableComment = "Everything tastes good in soup."
}

//: > **Эксперимент**:
//: > Попробуйте удалить случай default. Что за ошибку вы получите?
//:
//: Вы можете учитывать индекс с помощью `Range`. Используйте _half-open range operator_ ( `..<`) чтобы создать диапазон индексов.
//:
var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)

//: (`..<`) не включает в себя самое последнее (верхнее) число, например данный диапазон (0..<4) берет индексы от `0` до `3`, что заставляет выполнить 4 итерации цикла. Используйте _closed range operator_ ( `...`) чтобы создать диапазон от одного индекса до другого включительно.
//:
var secondForLoop = 0
for _ in 0...4 {
    secondForLoop += 1
}
print(secondForLoop)

//: Данный диапазон идет от `0` до `4` (5 итераций). Подчеркивание (_underscore_) (`_`) используется, когда вам не нужно знать на какой по счету итерации цикла вы находитесь. 
//:
//: [Назад](@previous) | [Далее](@next)
//:
//: [SnapBlog](http://snapblog.ru)
