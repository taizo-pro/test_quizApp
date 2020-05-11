//
//  ViewController.swift
//  testQuizApp
//
//  Created by 原田和輝 on 2020/04/21.
//  Copyright © 2020 Harada Kazuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,nowScoreDelegate {
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    
    
    
    let imagesList = ImagesList()
    
//    IBActionで検知した正答がどちらなのかを取得する変数
    var pickedAnswer = false
    
    var soundFile = SoundFile()
    
    var changeColor = ChangeColor()
    
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.14, topAlpha: 0.2, bottomR: 0.13, bottomG: 0.34, bottomB: 0.24, bottomAlpha: 1.0)
        
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        imageView.layer.cornerRadius = 20.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
            
        }
        
        maxScoreLabel.text = String(maxScore)
        
    }
    
    
    
    
    @IBAction func answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1 {
            
            pickedAnswer = true
            
//            丸ボタンが押された時
            
//            ユーザーが押したボタンが丸ボタンだった場合
            
//            丸ボタンの効果音を流す
            soundFile.playSound(fileName: "maruSound", extensionName: "mp3")
            
        }else if (sender as AnyObject).tag == 2{
            
            pickedAnswer = false
            
            //            ×ボタンが押された時
                        
            //         ユーザーが押したボタンが丸ボタンだった場合
                        
            //            ×ボタンの効果音を流す
            
            soundFile.playSound(fileName: "batsuSound", extensionName: "mp3")
            
        }
        
//        回答があっているかどうかチェックする（①pickedAnswerの中身と②ImagesListのcorrectOrNotの値が一致しているかどうか）
            
        check()
        nextQuestion()
        
        
    }
    
    func check(){
        
        let correctAnswer = imagesList.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            
            print("正解")
            correctCount = correctCount + 1
            
        }else{
            
            print("間違い")
            wrongCount = wrongCount + 1
            
        }
        
    }
    
    func nextQuestion (){
        
        if questionNumber <= 9{
            
            questionNumber = questionNumber + 1
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
            
        }else{
            
            print("問題終了")
//            画面遷移
            performSegue(withIdentifier: "next", sender: nil)
            
        }
        
    }
    
    func nowScore(score: Int) {
        
        soundFile.playSound(fileName: "sound", extensionName: "mp3")

        maxScoreLabel.text = String(score)
        
    }
    
    
//    値をVCからnextVCへ渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "next"{
            
            let nextVC = segue.destination as! NextViewController
            
            nextVC.correctCount = correctCount
            nextVC.wrongCount = wrongCount
            nextVC.delegate = self
            
        }
        
    }
    

}

