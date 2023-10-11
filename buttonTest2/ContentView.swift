//
//  ContentView.swift
//  buttonTest2
//
//  Created by John Welch on 10/8/23.
//

import SwiftUI
import Observation


struct ContentView: View {
	@State var buttonDisabled: Bool = true
	@State var gridCells: [Cell]
	@State var boardSize: Int = 3

	init() {
		gridCells = Cell.buildCellArray(3)
	}

	var body: some View {
		HStack {
					VStack {
						Button {

						} label: {
							Text("Button2")
						}
						.disabled(buttonDisabled)
					}
					VStack {
						Picker("Board Size", selection: $boardSize) {
						    Text("3").tag(3)
						    Text("4").tag(4)
						    Text("5").tag(5)
						    Text("6").tag(6)
						    Text("7").tag(7)
						    Text("8").tag(8)
						    Text("9").tag(9)
						    Text("10").tag(10)
						}
						//picker properties
						//padding has to be separate for each dimensions
							//.modifier(basicTextModifierNoFrame())
							.frame(width: 140.0,alignment: .center)
							.padding(.top,2)

							.pickerStyle(MenuPickerStyle())
							.onChange(of: boardSize) {
								print("boardSize is: \(boardSize)")
								gridCells = Cell.buildCellArray(boardSize)
							}
					}

				}
		Grid(horizontalSpacing: 0, verticalSpacing: 0) {

			//changing the grid sizing to use boardSize makes it blow up with index out of range errors
			//for the label on the buttons. If that can be made to work, I rather like your version better.
			ForEach(0..<boardSize, id: \.self) { row in
				GridRow {
					ForEach(0..<boardSize, id: \.self) { col in
						GeometryReader { proxy in
							let index = (row * 3) + col
							Button {
								var theTuple = doSomethingElseOnClick(for: gridCells[index].index, myArray: gridCells)

								gridCells[index].title = theTuple.myTitle

								//if the buttonBlank1.toggle() line isn't commented out (or really any line modifying buttonblank, you will never see the title change cycle correctly.
								//I just need to ONLY enable that top button above the grid when the button i'm clicking on does not have a blank title, but I cannot figure out how to do it and not have the button title change work right.
								buttonDisabled = gridCells[index].shouldDisableTopButton()
							} label: {
								Text(gridCells[index].title)
									.frame(width: proxy.frame(in: .global).width,height: proxy.frame(in: .global).height)
							}
						}
					}
				}
			}
		}
	}
}

#Preview {
    ContentView()
}
