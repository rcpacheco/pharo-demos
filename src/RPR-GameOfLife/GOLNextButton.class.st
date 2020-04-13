Class {
	#name : #GOLNextButton,
	#superclass : #GOLButton,
	#category : #'RPR-GameOfLife-Elements'
}

{ #category : #initialization }
GOLNextButton >> initialize [
	"Set the initial state of the button"

	super initialize.
	self
		label: 'Next >>';
		addEventHandlerOn: BlMouseDownEvent
			do: [ :evt | 
			self fireEvent: GOLDoNextLifeEvent new ]
]
