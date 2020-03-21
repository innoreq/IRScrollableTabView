//
//  File.swift
//  
//
//  Created by Gerhard Schneider on 21.03.20.
//

import Foundation
import SwiftUI


struct TabItemViewSetter: View {
	
	
	let index: Int
	
	
	var body: some View {
		
		GeometryReader { geo in
			
			Rectangle()
				.fill(Color.clear)
				.preference(key: TabItemPreferenceKey.self,
							value: [TabItemData(viewIndex: self.index,
												rect: geo.frame(in: .named("tabItem")))])
			
		}
	}
}

