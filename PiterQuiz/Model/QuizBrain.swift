//
//  QuizBrain.swift
//  PiterQuiz
//
//  Created by  Юлия Григорьева on 11.04.2022.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Где находится город с таким же названием?", a: ["Флорида, CША", "Канада", "Австралия"], correctAnswer: "Флорида, CША"),
        Question(q: "Кто такие эрмики?", a: ["Питерские художники", "Завсегдатаи Эрмитажа", "Эрмитажные коты"], correctAnswer: "Эрмитажные коты"),
        Question(q: "Кто из героев фильма сказал:\n'В этом городе львов больше, чем жителей?'", a: ["Джузеппе", "Ольга", "Антонио"], correctAnswer: "Джузеппе"),
        Question(q: "Где исток Невы?", a: ["В Онежском озере", "В Ладожском озере", "В Финском заливе"], correctAnswer: "В Ладожском озере"),
        Question(q: "Самая глубокая станция петербургского метро?", a: ["Спортивная", "Адмиралтейская", "Василеостровская"], correctAnswer: "Адмиралтейская"),
        Question(q: "Из чего сделан Медный всадник?", a: ["Бронза", "Чугун", "Медь"], correctAnswer: "Бронза"),
        Question(q: "Сколько раз город менял название?", a: ["2", "3", "4"], correctAnswer: "3"),
        Question(q: "Какого кафе нет в Питере?", a: ["Саквояж беременной шпионки", "Пивная диета", "Жаба душит"], correctAnswer: "Жаба душит"),
        Question(q: "Когда в Питере белые ночи?", a: ["1 мая - 19 мая", "20 мая - 10 июня", "11 июня - 2 июля"], correctAnswer: "11 июня - 2 июля"),
        Question(q: "В Питере...", a: ["Пить", "Гулять", "Любить"], correctAnswer: "Пить"),
        Question(q: "Васька для питерцев - это:", a: ["Памятник коту", "Васильевский остров", "Знаменитый ночной клуб"], correctAnswer: "Васильевский остров"),
        Question(q: "Кто автор строк? \nГород душный и суровый \nС черных труб сметает гарь... \nАх! своей столицей новой \nНедоволен государь", a: ["Пушкин", "Ахматова", "Мандельштам"], correctAnswer: "Ахматова"),
        Question(q: "Где в Питере по легенде зарыт клад?", a: ["В Петропавловской крепости", "В Ленинградском зоопарке", "В Екатерининском саду"], correctAnswer: "В Екатерининском саду")
    ]

    var questionNumber = 0
//    var score = 0

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
            if userAnswer == quiz[questionNumber].correctAnswer {
//            score += 1
            return true
        } else {
            return false
        }
    }


    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }

    func getFirstButtonText() -> String {
        return quiz[questionNumber].answer[0]
    }

    func getSecondButtonText() -> String {
        return quiz[questionNumber].answer[1]
    }

    func getThirdButtonText() -> String {
        return quiz[questionNumber].answer[2]
    }


    func getProgress() -> Float {
        let progress = Float(questionNumber + 1)/Float(quiz.count)
        return progress
    }

//    mutating func getScore() -> Int {
//        return score
//    }

}
