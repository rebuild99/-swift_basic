//
//  ViewController.swift
//  NavigationViewController_tutorial
//
//  Created by Jeff Jeong on 2019/12/23.
//  Copyright © 2019 Tuentuenna. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
        
    // '로그인' 버튼 이벤트 연결
    @IBOutlet weak var loginBtn: UIButton!
    
    // 뷰가 생성되었을때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 상단 네비게이션 바 부분을 숨김처리한다.
        self.navigationController?.isNavigationBarHidden = true
        
        // 로그인 버튼을 눌렀을때 수행할 이벤트 정의
        // action: 실행할 메소드 입력
        // for: 언제 이벤트가 발생?->터치가 이루어졌을 때
        loginBtn.addTarget(self, action: #selector(moveToMainViewController), for: .touchUpInside)
    }

    // 메인화면으로 이동
    // @objc -> obj-c의 메소드를 사용한다 의미
    @objc fileprivate func moveToMainViewController() {
        print("LoginViewController - moveToMainViewController called")
        
        // 객체를 인스턴스화(MainViewController 객체를 생성)
        let mainViewController = MainViewController()
        // 기존에 LoginView에서 사용한 네비게이션(화면전환 순서)를 가져온다.
        // self.navi~ : 자기자신을 가르킨다 , pushViewContoller : 다음화면전환을 가르킨다.
        self.navigationController?.pushViewController(mainViewController, animated: true)
        
    }
}

