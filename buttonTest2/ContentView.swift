//
//  ContentView.swift
//  buttonTest2
//
//  Created by John Welch on 10/8/23.
//

import SwiftUI
import Observation


struct ContentView: View {
	@State var buttonBlank1: Bool = true
	@State var boardSize: Int = 3
	@State var gridCellArr = buildStructArray(theGridSize: 3)
	
	//@Binding var gridCellArr: [Cell]
	var body: some View {

		HStack {
			Button {

			} label: {
				Text("Button2")
			}
			.disabled(buttonBlank1)
		}
		Grid(horizontalSpacing: 0, verticalSpacing: 0) {
			ForEach(0...2, id: \.self) { row in
				GridRow {
					ForEach(0...2, id: \.self) { col in
						GeometryReader { proxy in
							let index = (row * 3) + col
							Button {
								var theTuple = doSomethingElseOnClick(for: gridCellArr[index].index, myArray: gridCellArr)

								gridCellArr[index].title = theTuple.myTitle

								//if the buttonBlank1.toggle() line isn't commented out (or really any line modifying buttonblank, you will never see the title change cycle correctly.
								//I just need to ONLY enable that top button above the grid when the button i'm clicking on does not have a blank title, but I cannot figure out how to do it and not have the button title change work right.
								buttonBlank1 = theTuple.myCommitButtonStatus
							} label: {
								Text(gridCellArr[index].title)
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
