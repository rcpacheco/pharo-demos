Class {
	#name : #GOLLabel,
	#superclass : #BrLabel,
	#category : #'RPR-GameOfLife-Elements'
}

{ #category : #'instance creation' }
GOLLabel class >> text: aText [
	"Create a new instance of a Label with the required position attributes"

	| aLabel |
	aLabel := self new
		hFitContent;
		vFitContent;
		look: (BrGlamorousLabelLook new
					fontSize: 24;
					foreground: Color darkGray);
		text: aText.
	^ aLabel
]
