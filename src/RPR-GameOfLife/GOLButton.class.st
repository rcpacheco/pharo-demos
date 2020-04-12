Class {
	#name : #GOLButton,
	#superclass : #BrButton,
	#category : #'RPR-GameOfLife-Elements'
}

{ #category : #accessing }
GOLButton class >> text: aText [
"Create an Instance and initialize its content with the received text"
	^ self new
		label: aText;
		yourself
]

{ #category : #initialization }
GOLButton >> initialize [
	super initialize.
	self
	   hMatchParent;
		label: 'Button';
		look: GOLButtonLook new
]
