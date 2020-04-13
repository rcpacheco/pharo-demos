Class {
	#name : #GOLHeader,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'gameModel'
	],
	#category : #'RPR-GameOfLife-Elements'
}

{ #category : #'instance creation' }
GOLHeader class >> createWithModel: aModel [
	^ GOLHeader new
		gameModel: aModel;
		addElements.
]

{ #category : #initialization }
GOLHeader >> addElements [
	self
		addChildren:
			{(GOLLabel text: 'Age:').
			(GOLLabel text: 0).
			GOLBackButton new addEventHandler: (self newLastEventListener gameModel: gameModel).
			GOLToggleButton new.
			GOLNextButton new addEventHandler: (self newNextEventListener gameModel: gameModel).
			GOLLabel new}
]

{ #category : #accessing }
GOLHeader >> defaultHeight [
"Default height of the game header"
	^ 50
]

{ #category : #accessing }
GOLHeader >> gameModel [
	^ gameModel
]

{ #category : #accessing }
GOLHeader >> gameModel: anObject [
	gameModel := anObject
]

{ #category : #initialization }
GOLHeader >> initialize [
	"Creates a new instance and define its positioning, background and spacing attributes"

	super initialize.
	self 		relocate: 0 @ 0;
		hMatchParent;
		height: self defaultHeight;
		alignCenter;
		cellSpacing: 20;background: Color orange
]

{ #category : #'instance creation' }
GOLHeader >> newLastEventListener [
	^ GOLLastEventListener new
]

{ #category : #'instance creation' }
GOLHeader >> newNextEventListener [
	^ GOLNextEventListener new
]
