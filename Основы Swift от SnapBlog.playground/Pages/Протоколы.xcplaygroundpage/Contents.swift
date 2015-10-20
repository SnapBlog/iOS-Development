//: # Курс "Swift-Drift" от [SnapBlog](http://snapblog.ru)
//:
//: ## Протоколы
//:
//: _Протокол_ определяет план методов, свойств, и других требований, которые подходят для конкретной задачи или какой-то функциональности. Протокол на самом деле не обеспечивает реализацию какого-либо из требований — он только описывает то, как должна выглядеть реализация. Протокол может быть _принят_ классом, структурой или перечислением для обеспечения фактической реализации этих требований. Любой тип, который удовлетворяет требованиям протокола, имеет указание _соответствовать_ этому протоколу.
//:
//: Используйте `protocol` чтобы объявить протокол.
//:
protocol ExampleProtocol {
     var simpleDescription: String { get }
     func adjust()
}

//: > **Заметка**:
//: > `{ get }` после свойства `simpleDescription` показывает, что оно предназначено только для _чтения_ (_read-only_), это означает, что значение свойства можно получить, но его нельзя изменить.
//:
//: Протоколы могут требовать, чтобы соответствующие типы имели специальные свойства экземпляра, методы экземпляра, методы типа, операторы и индексы. Протоколы могут требовать реализацию специальных методов экземпляра и методов типа для соответствующих типов. Эти методы написаны как часть определения данного протокола в точности также, как и для обычного экземпляра и методов типа, но без фигурных скобок или тела метода.
//:
//: Классы, структуры и перечисления принимают протокол в качестве списка имен, после их имя, разделенных двоеточием. Тип может принять любое количество протоколов, которые указываются в списке через запятую. Если класс имеет суперкласс, то имя суперкласса должно быть первым в списке, а далее идут имена протоколов. Вы осуществляете соответствие протоколу, путем реализации всех его требований. 
//:
//: Здесь, `SimpleClass` принимает протокол `ExampleProtocol` и соответствует ему, реализуя свойство `simpleDescription` и метод `adjust()`.
//:
class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105
     func adjust() {
          simpleDescription += "  Now 100% adjusted."
     }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

//: Протоколы являются первоклассными типами, это означает, что они могут рассматриваться другими названными типами. Например, вы можете создать массив типа `ExampleProtocol` и вызвать `adjust()` для каждого экземпляра в нем (потому что каждый экземпляр в массиве будет гарантированно реализовываться `adjust()`, одним из требований протокола).
//:
class SimpleClass2: ExampleProtocol {
     var simpleDescription: String = "Another very simple class."
     func adjust() {
          simpleDescription += "  Adjusted."
     }
}

var protocolArray: [ExampleProtocol] = [SimpleClass(), SimpleClass(), SimpleClass2()]
for instance in protocolArray {
   instance.adjust()
}
protocolArray

//: [Назад](@previous) | [Далее](@next)
//:
//: [SnapBlog](http://snapblog.ru)

