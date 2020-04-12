Class {
	#name : #GOLBackButton,
	#superclass : #GOLButton,
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLBackButton >> initialize [
	"Set the initial state of the button"

	super initialize.
	self
		label: '<< Back';
		addEventHandlerOn: BlMouseDownEvent
			do: [ :evt | 
			Transcript
				show: 'Back click';
				cr ]
]
