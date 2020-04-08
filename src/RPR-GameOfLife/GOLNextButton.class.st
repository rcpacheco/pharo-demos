Class {
	#name : #GOLNextButton,
	#superclass : #GOLButton,
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLNextButton >> initialize [
	"Set the initial state of the button"

	super initialize.
	self label: 'Next >>'
]
