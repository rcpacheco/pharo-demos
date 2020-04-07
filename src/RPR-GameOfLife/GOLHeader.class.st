Class {
	#name : #GOLHeader,
	#superclass : #BrHorizontalPane,
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLHeader >> defaultHeight [
	^ 50
]

{ #category : #initialization }
GOLHeader >> initialize [
	super initialize.
	self
		hMatchParent;
		alignCenter;
		cellSpacing: 20;
		background: Color orange
]
