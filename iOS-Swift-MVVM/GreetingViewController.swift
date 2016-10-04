//
//  GreetingViewController.swift
//  iOS-Swift-Base-MVVM
//
//  Created by Daniel Yanuar Sebastian on 10/3/16.
//  Copyright © 2016 Daniel Yanuar Sebastian. All rights reserved.
//

import UIKit

//MARK: - Class Declaration
class GreetingViewController: UIViewController {
  //MARK: Outlets
  @IBOutlet private var vwGreeting: GreetingView!
  
  var viewModel:GreetingViewModelProtocol! {
    didSet {
      self.viewModel.greetingDidChange = { [unowned self] viewModel in
        self.greetingLabel.text = viewModel.greeting
      }
    }
  }
  
  let showGreetingButton = UIButton()
  let greetingLabel = UILabel()
  
  //MARK: Lifecycle
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    self.showGreetingButton.addTarget(self.viewModel, action: "showGreeting", for: .touchUpInside)
//  }
//  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Assembling of MVVM
    let model = Person(firstName: "David", lastName: "Blaine")
    
    let viewModel = GreetingViewModel(person: model)
    
    let view = GreetingViewController()
    
    view.viewModel = viewModel
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  // layout code goes here
}
