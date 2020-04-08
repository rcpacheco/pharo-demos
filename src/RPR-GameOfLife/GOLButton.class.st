Class {
	#name : #GOLButton,
	#superclass : #BrButton,
	#category : #'RPR-GameOfLife'
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
	self hMatchParent; look: BrGlamorousButtonWithLabelLook new
]
