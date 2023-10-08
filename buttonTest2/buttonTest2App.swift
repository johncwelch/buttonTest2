//
//  buttonTest2App.swift
//  buttonTest2
//
//  Created by John Welch on 10/8/23.
//

import SwiftUI

@main
struct buttonTest2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

@Observable  class Cell: Identifiable {
	let id = UUID()
	var title: String = ""
	var buttonToggled: Bool = false
	var index: Int = 0
	var xCoord: Int = 0
	var yCoord: Int = 0
	var backCol: Color = .gray
}


func buildStructArray(theGridSize: Int) -> [Cell] {
	var myStructArray: [Cell] = []
	let arraySize = (theGridSize * theGridSize) - 1
	for i in 0...arraySize {
		myStructArray.append(Cell())
	}

	for i in 0...arraySize {
		myStructArray[i].index = i
	}
	return myStructArray
}

func doSomethingElseOnClick(for myIndex: Int, myArray: [Cell]) -> (myColor: Color, myTitle: String, myCommitButtonStatus: Bool) {
	var theCommitButtonStatus: Bool = true
	//print("\(myArray[myIndex].title)")
	//print("\(myIndex)")
	switch myArray[myIndex].title {
		case "":
			myArray[myIndex].title = "S"
			theCommitButtonStatus = false
			print("blank case")
		case "S":
			myArray[myIndex].title = "O"
			theCommitButtonStatus = false
			print("S case")
		case "O":
			myArray[myIndex].title = ""
			theCommitButtonStatus = true
			print("O case")
		default:
			print("Something went wrong, try restarting the app")
	}

	print("\(myArray[myIndex].title)")
	if myArray[myIndex].title == "Button" {
		print("it's a button")
	}
	var theColor: Color
	if myIndex <= 7 {
		let testIndex = myIndex + 1
		//print("\(myArray[testIndex].index)")
		theColor = Color.green
	} else {
		let testIndex = myIndex - 1
		//print("\(myArray[testIndex].index)")
		theColor = Color.blue
	}

	let theReturnTuple = (myColor: theColor, myTitle: myArray[myIndex].title, myCommitButtonStatus: theCommitButtonStatus)
	return theReturnTuple
	//return theColor
}
