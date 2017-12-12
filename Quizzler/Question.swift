//
//  Question.swift
//  Quizzler
//
//  Created by Branislav on 08/11/2017.


import Foundation

class Question{
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}
