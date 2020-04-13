Class {
	#name : #GOLToggleButton,
	#superclass : #GOLButton,
	#instVars : [
		'isRunning'
	],
	#category : #'RPR-GameOfLife-Elements'
}

{ #category : #initialization }
GOLToggleButton >> initialize [
	"Set the initial state of the button"

	super initialize.
	isRunning := false.
	self
		label: self stoppedLabel;
		addEventHandlerOn: BlMouseDownEvent
			do: [ :evt | 
			self toggleGameStatus]
]

{ #category : #initialization }
GOLToggleButton >> runningLabel [
"Define the label of the toggle button when the game is running"
	^ 'Stop'
]

{ #category : #initialization }
GOLToggleButton >> stoppedLabel [
	"Define the label of the toggle button when the game is stopped"

	^ 'Start'
]

{ #category : #updating }
GOLToggleButton >> toggleGameStatus [
	"Change the status and color of the cell"

	isRunning := isRunning not.
	isRunning
		ifTrue: [ self label: self runningLabel ]
		ifFalse: [ self label: self stoppedLabel ]
]
