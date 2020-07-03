//
//  main.swift
//  Lesson-2
import Foundation


func IsEven(a: Double) -> Array<String> {
    return[Int(a) % 2 == 0 ? "четное число" : "нечетное число"]
}

func Divisible3WithoutRemainder(a: Double) -> Array<String> {
    return[Int(a) % 3 == 0 ? "делится на 3 без остатка" : "Не делится на 3 без остатка"]
}


func CreateAscendingArray() -> Array<Int> {
    var FinalArray: Array<Int> = [Int]()
    for Item in 0 ... 99{
        FinalArray.append(Item)
    }
    return FinalArray
}
func CalculateFinonacci(n: Int) -> Double{
    var a: Double = 1
    var b: Double = 1
    guard n != 0 else { return Double(n) }
    guard n > 1 else  { return a }
    
    for _ in 2...n {
        a = a + b
        b = a
    }
    return a
}

func CalculateEratosfen(n: Int) -> Array<Int>{
    var MyArray: Array<Int> = [Int]()
    var TmpArray: Array<Int> = [Int]()
    var FirstNormal: Int = -1
    for Item in 2...n+1 {
           MyArray.append(Item)
       }
    var p: Int = MyArray[0]
    var i: Int = 2
    while i*p < n {
        
        for Item in 0...MyArray.count-1 {
            if MyArray[Item] % i*p != 0 || MyArray[Item] <= p {
                    TmpArray.append(MyArray[Item])
                    if FirstNormal == -1 && MyArray[Item] > p {
                        FirstNormal = MyArray[Item]
                    }
            }
        }
        MyArray = TmpArray
        TmpArray.removeAll()
        p = FirstNormal
        FirstNormal = -1
        i += 1
    }
    return MyArray
}

func CreateArrayFibonacci() -> Array<Double> {
    var FinalArray: Array<Double> = [Double]()
    for Item in 0 ... 99 {
        FinalArray.append(CalculateFinonacci(n: Item))
    }
    return FinalArray
}

func FilterArray(SourceArray: Array<Int>) -> Array<Int> {
    var FinalArray: Array<Int> = [Int]()
    for Item in 0 ... 99{
        if SourceArray[Item] % 2 != 0 && SourceArray[Item] % 3 == 0{
           FinalArray.append(Item)
        }
    }
    return FinalArray
}

func read_params(n:Int,type:Int) -> Array<Double> {
    print("Введите \(n) параметра, через Enter")
    var f_array: Array<Double> = [Double]()
    var tmp_input: Double? = nil
    for _ in 0 ... n-1 {
        tmp_input = nil
        while tmp_input == nil {
            
            switch type {
                case 1:
                    tmp_input = Double(readLine()!.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789").inverted))
                case 2:
                    tmp_input = Double(readLine()!.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted))
                case 3:
                    tmp_input = Double(readLine()!.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted))
                default:
                    tmp_input = Double(readLine()!.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789.").inverted))
            }
            if tmp_input != nil {
                f_array.append(tmp_input!)
            }
            else {
                print("Неправильный ввод, введите это число еще раз")
                tmp_input = nil
            }
        }
    }
    return f_array
}

func main() {
    var tmp_input: Double? = nil
    print("В данной программе Вы можете выбрать 1 из 3х действий: \n 1) Проверить четное число или нет \n 2) Проверить делится ли число на 3 без остатка \n 3) Создать возрастающий массив из 100 чисел \n 4) Создать возрастающий массив из 100 чисел и удалить оттуда все четные числа и числа, которые которые не делятся на 3\n 5) Создать массив из 100 чисел Фибоначи \n 6) Заполнить массив из 100 элементов различными простыми числами \n ")
    while tmp_input == nil {
        print("Введите цифру того, что Вы хотите сделать")
        tmp_input = Double(readLine()!.trimmingCharacters(in: CharacterSet(charactersIn: "123456789").inverted))
        if tmp_input != nil{
            if tmp_input! > 6.0 || tmp_input! < 1.0 {
                print("Введенный выбор вне диапазона [1;6], попробуйте еще раз")
                tmp_input = nil
            }
        }
        else {
            print("Введенный выбор вне диапазона [1;6], попробуйте еще раз")
        }
    }
    
    switch tmp_input {
        case 1:
            print("Введите целое число (знак , будет проигнорирован)")
            print(IsEven(a:read_params(n:1,type:1)[0])[0])
        case 2:
            print("Введите целое число (знак , будет проигнорирован)")
            print(Divisible3WithoutRemainder(a:read_params(n:1,type:1)[0])[0])
        case 3:
            print("")
            print(CreateAscendingArray())
        case 4:
            print("")
            print(FilterArray(SourceArray: CreateAscendingArray()))
        case 5:
            print("")
            print(CreateArrayFibonacci())
        case 6:
            print(CalculateEratosfen(n:100))
        default:
        print("Catch All")
    }
    
}

main()

