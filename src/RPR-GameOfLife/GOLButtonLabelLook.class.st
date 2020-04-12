Class {
	#name : #GOLButtonLabelLook,
	#superclass : #BrTextLabelLook,
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLButtonLabelLook >> initialize [
	"Set the initial state of the Label of the button"

	super initialize.
	self
		bold;
		fontName: 'Source Sans Pro'.
	self
		add:
			(BrInteractiveCommonLook new
				default: [ self foreground: Color gray ];
				hovered: [ self foreground: Color white ];
				pressed: [ self foreground: Color paleBlue ];
				disabled: [ self foreground: Color veryLightGray ]).
	self
		add:
			(BrSizeAdjustmentLook new
				default: [ self fontSize: 20 ];
				tiny: [ self fontSize: 10 ];
				small: [ self fontSize: 16 ];
				large: [ self fontSize: 26 ];
				huge: [ self fontSize: 36 ])
]
