//
//  MainViewController.swift
//  NavigationViewController_tutorial
//
//  Created by Test on 2022/01/06.
//  Copyright © 2022 Tuentuenna. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    // 제목(선언과 동시에 정의)
    var titleLabel: UILabel = {
        // UILabel을 가져와서 안에 속성값(text 등)을 정의한 뒤 return 해준다 라는 역할 수행
        let label = UILabel()
        label.text = "메인화면"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        return label
    }()
    
    // 버튼생성, let : 상수로 정의
    let changeBtn : UIButton = {
        // system으로했을 때 효과가 나타남
        let btn = UIButton(type: .system)
        // for : .normal -> 일반적일 때(그냥이벤트없이 처음 화면출력될때)
        btn.setTitle("배경색바꾸기", for : .normal)
        btn.setTitleColor(.black, for : .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.backgroundColor = UIColor.white
        // 버튼의 각 모서리를 둥글게
        btn.layer.cornerRadius = 5
        // 버튼안에 글자의 간격조정
        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        btn.addTarget(self, action: #selector(changeBg), for: .touchUpInside)
        
        return btn
    }()
    
    // ':' 는 해당 변수의 자료형선언
    var isBgOrange : Bool?
    
    // 뷰가생성되었을 때 아래 실행
    // View가 생성되었을 때 실행 메소드 override하여 재정의 한다.
    override func viewDidLoad() {
        
        // UIViewController가 가지고있는 viewDidLoad 로직을 그대로 사용하겠다.
        super.viewDidLoad()
        
        isBgOrange = true
        
        // 여기서 지정하는 view는 스토리보드로 따졌을 때 가장 최상위의 view를 의미한다(캡처추가)
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        // 뷰 추가생성 -> 최상위 view안에는 또 새로운 view가 추가적으로 생성될 수 있다.
        view.addSubview(titleLabel)
        
        // 타이틀 레이블의 위치를 정해주어야한다(기존 스토리보드의 경우 제약을 두어 가운데 위치)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        // 타이틀레이블의 제약사항을 추가하며 상위 view의 Y축센터의 가운데와 일치되도록
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // 뷰 추가생성 : changeBtn
        view.addSubview(changeBtn)
        
        // 버튼이 "메인화면" 이라는 글자아래 (1)간격을 유지하고, (2)가운데위치 하도록 정의
        changeBtn.translatesAutoresizingMaskIntoConstraints = false
        changeBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        changeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc fileprivate func changeBg() {
        print("MainViewController - changeBG() called")
        
        if isBgOrange == true {
            
            view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            isBgOrange = false
            
        } else {
            
            view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            isBgOrange = true
        }
        
        // '\(isBgOrange)' -> print문 안에 표현할 값
        print("MainViewController - changeBG() called . isBgOrange : \(isBgOrange)")
    }
    
}
