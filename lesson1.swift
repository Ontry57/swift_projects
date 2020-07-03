//
//  main.swift1
//  Lesson-1
//
//  Created by korolev-ap on 27.06.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//
import Foundation

func solve_equation(a: Double, b: Double, c:Double) -> Array<String> {
    let D: Double = pow(b,2) - 4 * a * c
    if D>0  {
        let x1: Double = ( -b + pow(D,0.5) ) / 2 * a
        let x2: Double = ( -b - pow(D,0.5) ) / 2 * a
        return[String(format:"%.3f", x1),String(format:"%.3f", x2)]
    }
    else {
       return ["Решение уравнения находится в комплексной плоскости"]
    }
}

func triangle(a: Double, b: Double) -> Array<String> {
    let S: Double = 0.5 * a * b
    let c: Double = pow(pow(a,2) + pow (b,2),0.5)
    let P: Double = a + b + c
    return[String(format:"%.3f", S),String(format:"%.3f", P),String(format:"%.3f", c)]
}

func deposit(sum: Double, pers: Double) -> Double {
    let Sum_final: Double = sum * pow(1 + (pers/100)/12,5*12)
    return Sum_final
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
                    tmp_input = Double(readLine()!.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789.").inverted))
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
    print("В данной программе Вы можете выбрать 1 из 3х действий: \n 1) Решить квадратное уравнение \n 2) Рассчитать параметры треугольника \n 3) Найти сумму вклада через 5 лет.  \n\n ")
    while tmp_input == nil {
        print("Введите цифру того, что Вы хотите сделать")
        tmp_input = Double(readLine()!.trimmingCharacters(in: CharacterSet(charactersIn: "123456789").inverted))
        if tmp_input != nil{
            if tmp_input! > 3.0 || tmp_input! < 1.0 {
                print("Введенный выбор вне диапазона [1;3], попробуйте еще раз")
                tmp_input = nil
            }
        }
        else {
            print("Введенный выбор вне диапазона [1;3], попробуйте еще раз")
        }
    }
    
    switch tmp_input {
        case 1:
            print("Введите параметры a,b,c для квадратного уравнения вида ax^2 + bx + c = 0")
            let eq_array: Array<Double> = read_params(n:3,type:1)
            let final_1: Array<String> = solve_equation (a:eq_array[0],b:eq_array[1],c:eq_array[2])
            if final_1.count == 2 {
                print(" x1 = " + final_1[0] + " \n x2 = " + final_1[1] )
            }
            else {
                print(final_1[0])
            }
        case 2:
            print("Введите катеты прямоугольного треугольника a,b (отрицательные значение будут взяты по модулю)")
            let triag_array: Array<Double> = read_params(n:2,type:2)
            let final_2: Array<String> = triangle (a:triag_array[0],b:triag_array[1])
            print(" Площадь = " + final_2[0] + " \n Периметр = " + final_2[1] + "\n гипотенуза = " + final_2[2])
        case 3:
            print("Введите cумму вклада и проценты по вкладу (отрицательные значение будут взяты по модулю)")
            let dep_array: Array<Double> = read_params(n:2,type:3)
            let final_3: Double = deposit(sum:dep_array[0],pers:dep_array[1])
            print(" Финальная сумма на вкладе через 5 лет: " + String(format:"%.3f", final_3))
        default:
        print("Catch All")
    }
    
}

main()
