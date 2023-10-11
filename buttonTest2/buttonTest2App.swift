//
//  buttonTest2App.swift
//  buttonTest2
//
//  Created by John Welch on 10/8/23.
//

import SwiftUI
import Observation

@main
struct buttonTest2App: App {
    var body: some Scene {
	   WindowGroup {
		  ContentView()
	   }
    }
}

@Observable class Cell: Identifiable {
	let id = UUID()
	var title: String = ""
	var titleState: TitleState = .blank
	var buttonToggled: Bool = false
	var index: Int = 0
	var xCoord: Int = 0
	var yCoord: Int = 0
	var color: Color = .gray
	

	/// Calculation for whether or not to disable the button above the grid.
	func shouldDisableTopButton() -> Bool {
		title == ""
	}

	/// Moved `buildStructArray` here, but renamed to `buildCellArray` (since we're in the Cell class).
	/// Simplified from original by smooshing the two loops together.
	static func buildCellArray(_ size: Int) -> [Cell] {
		var myStructArray: [Cell] = []
		let arraySize = (size * size) - 1
		for i in 0...arraySize {
			var cell = Cell()
			cell.index = i
			myStructArray.append(cell)
		}
		return myStructArray
	}
}

func doSomethingElseOnClick(for myIndex: Int, myArray: [Cell]) -> (myColor: Color, myTitle: String, myCommitButtonStatus: Bool) {
	var theCommitButtonStatus: Bool = true
	var theColor: Color

	let button = myArray[myIndex]
	button.titleState = myArray[myIndex].titleState.nextTitle()
	button.title = button.titleState.description

	if button.index <= 7 {
		let touchedButton = myArray[myIndex + 1]
		theColor = .green
		touchedButton.color = .green
	} else {
		let touchedButton = myArray[myIndex - 1]
		theColor = .blue
		touchedButton.color = .blue
	}
	print(button.titleState.debugDescription)


	let theReturnTuple = (myColor: theColor, myTitle: myArray[myIndex].title, myCommitButtonStatus: theCommitButtonStatus)
	return theReturnTuple
	//return theColor
}
