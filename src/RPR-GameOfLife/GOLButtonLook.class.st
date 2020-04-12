Class {
	#name : #GOLButtonLook,
	#superclass : #BrLook,
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLButtonLook >> initialize [
	"Set the initial state of the Look of the buttons of the button"

	super initialize.
	self
		addAll:
			{GOLButtonLabelLook new.
			GOLButtonExteriorLook new}
]
