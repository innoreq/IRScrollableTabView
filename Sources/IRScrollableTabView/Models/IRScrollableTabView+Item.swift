//
//  IRScrollableTabView+Item.swift
//  Views
//
//  Created by Gerhard Schneider on 17.03.20.
//  Copyright © 2020 innoreq GmbH. All rights reserved.
//

import Foundation
import SwiftUI


extension IRScrollableTabView {
	
	
	public struct Item: Identifiable {
		
		public var id: UUID
		
		public var title: String
		public var image: Image

		
		public init(title: String,
					image: Image = Image(systemName: "circle")) {

			self.id = UUID()

			self.title = title
			self.image = image
		}
	}
}
