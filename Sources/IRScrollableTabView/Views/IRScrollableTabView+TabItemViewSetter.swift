//
//  IRTabItemViewSetter.swift
//  Views
//
//  Created by Gerhard Schneider on 17.03.20.
//  Copyright © 2020 innoreq GmbH. All rights reserved.
//

import Foundation
import SwiftUI


extension IRScrollableTabView {
	

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
}
