//
//  IRScrollableTabView+Service.swift
//  Views
//
//  Created by Gerhard Schneider on 17.03.20.
//  Copyright © 2020 innoreq GmbH. All rights reserved.
//

import Foundation
import SwiftUI


extension IRScrollableTabView {
	
	
	public final class Service: ObservableObject {
		
		
		@Published var currentDestinationView: AnyView
		@Published var tabItems: [IRScrollableTabView.Item]
		@Published var selectedIndex: Int {
			
			didSet {
				
				self.currentDestinationView = self.selectionClosure(selectedIndex)
			}
		}
		
		
		private var selectionClosure: (Int) -> AnyView


		public init(initialDestinationView: AnyView? = nil,
					tabItems: [IRScrollableTabView.Item],
					initialSelectedIndex: Int,
					selectionClosure: @escaping (Int) -> AnyView) {
			
			self.tabItems = tabItems
			self.selectedIndex = initialSelectedIndex
			self.selectionClosure = selectionClosure
			self.currentDestinationView = initialDestinationView ?? selectionClosure(initialSelectedIndex)
		}
	}
}
