//
//  Model.swift
//  Task_number_3
//
//  Created by Кирилл Блохин on 26.07.2021.
//
import Foundation

struct Text {
    func hello(word: String) -> String {
        if word == "leohl"{
            return "Hello"
        } else {
            return NSLocalizedString("another_word", comment: "")
        }
    }
}

