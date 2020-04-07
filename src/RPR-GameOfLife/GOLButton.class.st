Class {
	#name : #GOLButton,
	#superclass : #BrButton,
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLButton class >> text: aText [

	^ self new label: aText; yourself
]

{ #category : #initialization }
GOLButton >> initialize [
	super initialize.
	self hMatchParent; look: BrGlamorousButtonWithLabelLook new
]
