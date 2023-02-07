//
//  ViewController.swift
//  UpDownGame
//
//  Created by SeungYeon Yoo on 2022/04/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb.png"), for: .normal)
        
    }

    // slider를 사용자가 움직일 때마다 여기에 어떤 값이 들어오게 된다.
    // slide가 실행될 때 이 코드가 동작할 수 있게끔 조치를 취해줘야 한다.
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    // 버튼을 눌렀을 때의 값을 알고 싶다.
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
    }
    
    // 리셋버튼
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
    }

}

