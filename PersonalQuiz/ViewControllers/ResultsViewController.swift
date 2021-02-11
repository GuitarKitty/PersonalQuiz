//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var animalTextLabel: UILabel!
    @IBOutlet var animalTypeLabel: UILabel!
    
    var choseAnimal: [Answer]!
    
    override func viewDidLoad(){
        
        //MARK: - Main logic for sorting an array of answers
        
        navigationItem.setHidesBackButton(true, animated: false)
        let dog: Float = 0
        let cat: Float = 0
        let rabbit: Float = 0
        let turtle: Float = 0
        var maxPointAnimal: [Float] = [dog,cat,rabbit,turtle]
        
        for index in 0...(choseAnimal.count-1) {
            switch choseAnimal[index].type{
            case .dog:
                if choseAnimal[index].text == "Стейк" {
                    maxPointAnimal[0] += 0.125
                }
                if choseAnimal[index].text == "Плавать" {
                    maxPointAnimal[0] += 0.25
                    fallthrough
                }
                if choseAnimal[index].text == "Обожаю" {
                    maxPointAnimal[0] += 0.5
                }
                
            case .cat:
                if choseAnimal[index].text == "Рыба"{
                    maxPointAnimal[1] += 0.125
                }
                if choseAnimal[index].text == "Спать" {
                    maxPointAnimal[1] += 0.25
                    fallthrough
                }
                if choseAnimal[index].text == "Ненавижу" {
                    maxPointAnimal[1] += 0.5
                }
                
            case .rabbit:
                if choseAnimal[index].text == "Морковь"{
                    maxPointAnimal[2] += 0.125
                }
                if choseAnimal[index].text == "Обниматься"{
                    maxPointAnimal[2] += 0.25
                    fallthrough
                }
                if choseAnimal[index].text == "Нервничаю"{
                    maxPointAnimal[2] += 0.5
                }
                
            case .turtle:
                if choseAnimal[index].text == "Кукуруза"{
                    maxPointAnimal[3] += 0.125
                }
                if choseAnimal[index].text == "Есть" {
                    maxPointAnimal[3] += 0.25
                }
                if choseAnimal[index].text == "Не замечаю"{
                    maxPointAnimal[3] += 0.5
                }
            }
            
        }
        
        // MARK: - Compute and show result
        
        let max = maxPointAnimal.map({$0}).max()
        if maxPointAnimal[0] == max {
            animalTypeLabel.text = "Вы - 🐶"
            animalTextLabel.text = AnimalType.dog.definition
        }else if maxPointAnimal[1] == max{
            animalTypeLabel.text = "Вы - 🐱"
            animalTextLabel.text = AnimalType.cat.definition
        }else if maxPointAnimal[2] == max{
            animalTypeLabel.text = "Вы - 🐰"
            animalTextLabel.text = AnimalType.rabbit.definition
        }else if maxPointAnimal[3] == max{
            animalTypeLabel.text = "Вы - 🐢"
            animalTextLabel.text = AnimalType.turtle.definition
        }
    }
}


