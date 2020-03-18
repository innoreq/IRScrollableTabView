//
//  IRScrollableTabViewIndicator.swift
//  Views
//
//  Created by Gerhard Schneider on 18.03.20.
//  Copyright © 2020 innoreq GmbH. All rights reserved.
//

import SwiftUI


extension IRScrollableTabView {

	
	struct Indicator: View {

		
		var configuration: IRScrollableTabView.Configuration


		public init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration()) {

			self.configuration = configuration
		}

		
		var body: some View {

			return RoundedRectangle(cornerRadius: configuration.indicatorCornerRadius)
				.foregroundColor(configuration.indicatorForegroundColor)
				.shadow(radius: configuration.indicatorShadowRadius)
		}
	}
}


struct IRScrollableTabViewIndicator_Previews: PreviewProvider {

	static var previews: some View {
    
		IRScrollableTabView.Indicator()
    }
}
