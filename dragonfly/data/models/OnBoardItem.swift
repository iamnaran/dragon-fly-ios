//
//  OnBoard.swift
//  dragonfly
//
//  Created by Narayan Panthi on 9/18/25.
//

import Foundation
import SwiftUI

// MARK: - ONBOARD DATA MODEL

struct BoardItem: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var gradientColors: [Color]
}


import Foundation
import SwiftUI

// MARK: - FRUITS DATA

let boardItems : [BoardItem] = [
    BoardItem(
      title: "Welcome",
      headline: "Hi This is boarding example 1",
      image: "blueberry",
      gradientColors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]
    ),
    BoardItem(
      title: "Strawberry",
      headline: "Widely appreciated for its characteristic aroma,  red color, juicy texture, and sweetness.",
      image: "strawberry",
      gradientColors: [Color("ColorStrawberryLight"), Color("ColorStrawberryDark")]
    ),
    BoardItem(
      title: "Lemon",
      headline: "There's no doubt lemons are delicious, but does adding them to water make you healthier?",
      image: "lemon",
      gradientColors: [Color("ColorLemonLight"), Color("ColorLemonDark")]
    ),
    BoardItem(
      title: "Plum",
      headline: "Plums are a very nutritious fruit. An excellent source of vitamins, minerals, fiber and antioxidants.",
      image: "plum",
      gradientColors: [Color("ColorPlumLight"), Color("ColorPlumDark")]
    ),
    BoardItem(
      title: "Lime",
      headline: "Sour, round, and bright green citrus fruits. Limes are high in vitamin C, antioxidants, and other nutrients.",
      image: "lime",
      gradientColors: [Color("ColorLimeLight"), Color("ColorLimeDark")]
    ),
    BoardItem(
      title: "Pomegranate",
      headline: "Sweet, bell-shaped fruits that have been enjoyed since ancient times. They can be eaten crisp or soft.",
      image: "pomegranate",
      gradientColors: [Color("ColorPomegranateLight"), Color("ColorPomegranateDark")]
    ),
    BoardItem(
      title: "Pear",
      headline: "Sweet, bell-shaped fruits that have been enjoyed since ancient times. They can be eaten crisp or soft.",
      image: "pear",
      gradientColors: [Color("ColorPearLight"), Color("ColorPearDark")]
    ),
    BoardItem(
      title: "Gooseberry",
      headline: "Sweet, bell-shaped fruits that have been enjoyed since ancient times. They can be eaten crisp or soft.",
      image: "gooseberry",
      gradientColors: [Color("ColorGooseberryLight"), Color("ColorGooseberryDark")]
    ),
   
]
