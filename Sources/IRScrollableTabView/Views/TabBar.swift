//
//  File.swift
//  
//
//  Created by Gerhard Schneider on 21.03.20.
//

import Foundation
import SwiftUI
import SwiftyBeaver


struct TabBar: View {
	
	
	// MARK: - Environment
	
	
	@EnvironmentObject var service: IRScrollableTabView.Service

	
	// MARK: - Properties
	
	
	var configuration: IRScrollableTabView.Configuration


	// MARK: - States


	@State private var rect: CGRect = CGRect()

	
	// MARK: - Initializers
	
	
	init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration()) {
		
		self.configuration = configuration
	}
	
	
	// MARK: - View Definition
	
	
	var body: some View {
		
		GeometryReader { geo in
			
			self.tabItems(geo: geo)
		}
			// Our reference space.
			.coordinateSpace(name: "TabBarReference")
			// Update the current tab positions.
			.onPreferenceChange(TabBarPreferenceKey.self) { preferences in

				self.rect = preferences.first?.rect ?? CGRect()
				SwiftyBeaver.debug("TabBar Pref Change: \(self.rect.size)")
			}
	}


	private func tabItems(geo: GeometryProxy) -> AnyView {
		
		SwiftyBeaver.debug("TabBar geo: \(geo.size)")
		
		if self.shallScroll(geo: geo) {
			
			return AnyView(
				ScrollView(.horizontal) {
					
					TabBarItems(configuration: self.configuration,
								containerSize: geo.size,
								contentSize: self.rect.size)
						// The button row shall have some space on top.
						.offset(y: 10)
			})
		}
		
		return AnyView(
			TabBarItems(configuration: self.configuration,
						containerSize: geo.size,
						contentSize: self.rect.size)
		)
	}


	private func shallScroll(geo: GeometryProxy) -> Bool {
		
		let result = geo.size.width < self.rect.size.width
		
		SwiftyBeaver.debug(result)
		
		return result
	}
}
