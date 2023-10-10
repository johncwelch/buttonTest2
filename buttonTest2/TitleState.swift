//
//  TitleState.swift
//  buttonTest2
//
//  Created by Deirdre Saoirse Moen on 10/10/23.
//

import Foundation

/// Because there's a small, finite set of possible button titles, pushing some of the complexity into an
/// enum allows for state-related code to get out of other people's way.
enum TitleState: CustomStringConvertible, CustomDebugStringConvertible {
	case blank, ess, oh

	/// What the button changes to when it's clicked.
	func nextTitle() -> TitleState {
		switch self {
		case .blank:
			return .ess
		case .ess:
			return .oh
		case .oh:
			return .blank
		}
	}

	/// Used for button title.
	var description: String {
		switch self {
		case .blank:
			return ""
		case .ess:
			return "S"
		case .oh:
			return "O"
		}
	}

	/// Used for debug print statement.
	var debugDescription: String {
		switch self {
		case .blank:
			return "blank case"
		case .ess:
			return "S case"
		case .oh:
			return "O case"
		}
	}
}
