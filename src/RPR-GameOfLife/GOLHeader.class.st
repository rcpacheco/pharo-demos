Class {
	#name : #GOLHeader,
	#superclass : #BrHorizontalPane,
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLHeader >> defaultHeight [
"Default height of the game header"
	^ 50
]

{ #category : #initialization }
GOLHeader >> initialize [
	"Creates a new instance and define its positioning, background and spacing attributes"

	super initialize.
	self
		relocate: 0 @ 0;
		hMatchParent;
		alignCenter;
		cellSpacing: 20;
		background: Color orange;
		addChildren:
			{(GOLLabel text: 'Age:').
			(GOLLabel text: 0).
			GOLBackButton new.
			GOLToggleButton new.
			GOLNextButton new.
			GOLLabel new}
]
