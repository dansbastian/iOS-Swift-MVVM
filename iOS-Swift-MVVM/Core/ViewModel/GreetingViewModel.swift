//
//  GreetingViewModel.swift
//  iOS-Swift-Base-MVVM
//
//  Created by Daniel Yanuar Sebastian on 10/3/16.
//  Copyright © 2016 Daniel Yanuar Sebastian. All rights reserved.
//

//MARK: - Protocol
protocol GreetingViewModelProtocol: class {
  var greeting: String? { get }
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set }
  
  init (person: Person)
  
  func showGreeting()
}

//MARK: - Class Declaration
class GreetingViewModel: GreetingViewModelProtocol {
  let person: Person
  
  var greeting: String? {
    didSet {
      self.greetingDidChange?(self)
    }
  }
  
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
  
  required init(person: Person) {
    self.person = person
  }
  
  func showGreeting() {
    self.greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
  }
}
