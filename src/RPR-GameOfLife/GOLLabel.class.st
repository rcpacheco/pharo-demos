Class {
	#name : #GOLLabel,
	#superclass : #BrLabel,
	#category : #'RPR-GameOfLife'
}

{ #category : #'instance creation' }
GOLLabel class >> text: aText [
"Create a new instance of a Label with the required position attributes"
	^ self new
		hFitContent;
		vFitContent;
		look: BrGlamorousLabelLook new;
		text: aText
]
