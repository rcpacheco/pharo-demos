Class {
	#name : #GOLButtonExteriorLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLButtonExteriorLook >> initialize [
	"Set the initial state of the external look of the button"

	super initialize.
	self
		default: [ :aWidget | 
			aWidget
				padding:
					(BlInsets
						top: 5
						left: 10
						bottom: 5
						right: 10).
			aWidget background: Color veryVeryLightGray ];
		hovered: [ :aWidget | aWidget background: (Color r: 0.27 g: 0.67 b: 0.99) ];
		pressed: [ :aWidget | aWidget background: (Color r: 0.04 g: 0.43 b: 0.85) ];
		disabled: [ :aWidget | aWidget background: Color veryVeryLightGray ].
	self add: BrLayoutResizerLook inherit.
	self add: BrLayoutAlignmentLook forHorizontalLinearLayout.
	self add: (BrFlatShadowLook new offset: 3 @ 3)
]
