//: Playground - noun: a place where people can play
//异常捕获
/*enum ShoppingCartError: Error {
    case cartIsFull
    case emptyCart
}

class Item {
    var price:Double?
    var name:String?
}

class LiteShoppingCart {
    var items:[Item] = []
    
    func addItem(item:Item) throws {
        guard items.count < 5 else {
            throw ShoppingCartError.cartIsFull
        }
        
        items.append(item)
    }
    
    func checkout(name:String) throws {
        guard items.count > 0 else {
            throw ShoppingCartError.emptyCart
        }
        // Continue with the checkout
    }
    func getResult(name:String) {
        print(name)
    }
}

let shoppingCart = LiteShoppingCart()
do {
    try shoppingCart.checkout(name: "hhh")
    print("Successfully checked out the items!")
} catch ShoppingCartError.cartIsFull {
        print("Couldn't add new items because the cart is full")
} catch ShoppingCartError.emptyCart {
    print("The shopping cart is empty!")
} catch {
    print(error)
}
*/
//词典
/*var companies: [String: String] = ["AAPL" : "Apple Inc", "GOOG" : "Google Inc", "AMZN" : "Amazon.com, Inc", "FB" : "Facebook Inc"]
for (stockCode, name) in companies {
    print("\(stockCode) = \(name)")
}*/
//guard关键字
/*func checkup(person: [String: String]) {
    
    // 检查身份证，如果身份证没带，则不能进入考场
    guard let id = person["id"] else {
        print("没有身份证，不能进入考场!")
        return
    }
    
    // 检查准考证，如果准考证没带，则不能进入考场
    guard let examNumber = person["examNumber"] else {
        print("没有准考证，不能进入考场!")
        return
    }
    
    // 身份证和准考证齐全，方可进入考场
    print("您的身份证号为:\(id)，准考证号为:\(examNumber)。请进入考场!")
    
}*/
//switch,0..<5,0...5
/*var n = 5
switch n {
case 0..<5:
    print("0..<5: \(n)")
case 5...10:
    print("5...10: \(n)")
default:
    print("default: \(n)")
}
 */

// 观察者
/*class Hotel {
    var roomCount:Int?
    var roomPrice:Int {
        willSet {
            if roomPrice < 0 {
                print("price < 0: \(roomPrice)")
            }
        }
        didSet {
            if roomPrice > 1000 {
                print("price > 1000: \(roomPrice)")
            }
        }
    }
    init() {
        roomPrice = 0
    }
}
var hotel = Hotel()
hotel.roomPrice = -1
hotel.roomPrice = 1001
 */
// for-in where
/*var numbers:[Int] = [1,2,3,100,101,200,300]
for number in numbers where number > 100 {
    print(number)
}*/
//Tuple元组
/*func testTuple()->(name:String,age:Int) {
   // var name:String = "gary",age:Int = 23,array:[Int] = [1,2,3]
    let name = "Gary"
    let age = 18
    return (name,age)
}
let result = testTuple()
print("name: \(result.name)\nage: \(result.age)")
*/

//optional binding
/*func findStockCode(company: String) -> String? {
    if (company == "Apple") {
        return "AAPL"
    } else if (company == "Google") {
        return "GOOG"
    }
    
    return nil
}

var stockCode:String? = findStockCode(company: "Facebook")//nil is returned
let text = "Stock Code - "
if let tempStockCode = stockCode {
    let message = text + tempStockCode
    print(message)
} else {
    print("stockCode is nil!")
}*/
//optional chaining
/*class Stock {
    var code: String?
    var price: Double?
}
func findStockCode(company: String) -> Stock? {
    if company == "Apple" {
        let aapl: Stock = Stock()
        aapl.code = "AAPL"
        aapl.price = 90.32
        return aapl
    } else if company == "Google" {
        let goog: Stock = Stock()
        goog.code = "GOOG"
        goog.price = 556.36
        return goog
    }
    return nil
}
if let sharePrice = findStockCode(company: "Apple")?.code {
    print(sharePrice)
}

typealias Gary = Int
var name:Gary = 18
print(name)*/
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    var a = 10;
    func stepForward(input: Int) -> Int { print(a);return input + 1; }
    func stepBackward(input: Int) -> Int { print(a);return input - 1; }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}

