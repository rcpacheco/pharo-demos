Class {
	#name : #GOLToggleButton,
	#superclass : #GOLButton,
	#category : #'RPR-GameOfLife-Elements'
}

{ #category : #initialization }
GOLToggleButton >> initialize [
	"Set the initial state of the button"

	super initialize.
	self label: self stoppedLabel
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
