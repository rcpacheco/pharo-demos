Class {
	#name : #GOLBackButton,
	#superclass : #GOLButton,
	#category : #'RPR-GameOfLife-Elements'
}

{ #category : #initialization }
GOLBackButton >> initialize [
	"Set the initial state of the button"

	super initialize.
	self
		label: '<< Back'
]
