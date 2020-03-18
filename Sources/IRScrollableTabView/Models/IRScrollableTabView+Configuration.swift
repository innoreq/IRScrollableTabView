//
//  IRScrollableTabView+Configuration.swift
//  IRScrollableTabView
//
//  Created by Gerhard Schneider on 18.03.20.
//

import Foundation
import SwiftUI


extension IRScrollableTabView {
	
	
	public struct Configuration {

		
		public var separatorLineColor: Color
		public var destinationBackgroundColor: Color
		public var indicatorForegroundColor: Color
		public var tabItemSelectedColor: Color
		public var tabItemUnselectedColor: Color

		public var itemWidth: CGFloat
		public var itemSpacing: CGFloat
		public var indicatorEnlargement: CGFloat
		public var indicatorCornerRadius: CGFloat
		public var indicatorShadowRadius: CGFloat

		public var animationDuration: Double
		public var tabItemImageFont: Font
		public var tabItemTextFont: Font
		

		public init(separatorLineColor: Color = .clear,
					destinationBackgroundColor: Color = .clear,
					indicatorForegroundColor: Color = .white,
					tabItemSelectedColor: Color = .red,
					tabItemUnselectedColor: Color = .blue,
					itemWidth: CGFloat = 70,
					itemSpacing: CGFloat = 10,
					indicatorEnlargement: CGFloat = 6,
					indicatorCornerRadius: CGFloat = 5,
					indicatorShadowRadius: CGFloat = 5,
					animationDuration: Double = 0.3,
					tabItemImageFont: Font = .largeTitle,
					tabItemTextFont: Font = .caption) {

			self.separatorLineColor = separatorLineColor
			self.destinationBackgroundColor = destinationBackgroundColor
			self.indicatorForegroundColor = indicatorForegroundColor
			self.tabItemSelectedColor = tabItemSelectedColor
			self.tabItemUnselectedColor = tabItemUnselectedColor

			self.itemWidth = itemWidth
			self.itemSpacing = itemSpacing
			self.indicatorEnlargement = indicatorEnlargement
			self.indicatorCornerRadius = indicatorCornerRadius
			self.indicatorShadowRadius = indicatorShadowRadius
			
			self.animationDuration = animationDuration
			self.tabItemTextFont = tabItemTextFont
			self.tabItemImageFont = tabItemImageFont
		}
	}
}
