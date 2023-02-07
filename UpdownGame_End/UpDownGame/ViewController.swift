//
//  ViewController.swift
//  UpDownGame
//
//  Created by SeungYeon Yoo on 2022/04/29.
//

import UIKit

class ViewController: UIViewController {
    
    // 컴퓨터가 제시하는 임의의 정수를 표현하는 변수 0 = 기본 할당 값(처음 앱 실행했을 때)
    var randomValue: Int = 0
    // 사용자가 몇 번 시도를 했는지
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb.png"), for: .normal)
        
        reset()
        
    }

    // slider를 사용자가 움직일 때마다 여기에 어떤 값이 들어오게 된다.
    // slide가 실행될 때 이 코드가 동작할 수 있게끔 조치를 취해줘야 한다.
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            self.reset()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion:nil)
    }
    
    // 버튼을 눌렀을 때의 값을 알고 싶다.
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        //사용자가 시도한 횟수를 보여줌
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            showAlert(message: "YOU HIT!!")
            reset()
        } else if tryCount >= 5 {
            showAlert(message: "You lose...")
            reset()
        } else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    // 리셋버튼
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
    
    func reset() {
        print("reset!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }

}

