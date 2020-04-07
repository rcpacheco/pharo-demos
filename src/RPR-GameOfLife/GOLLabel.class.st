Class {
	#name : #GOLLabel,
	#superclass : #BrLabel,
	#category : #'RPR-GameOfLife'
}

{ #category : #'instance creation' }
GOLLabel class >> text: aText [
	^ self new
		hFitContent;
		vFitContent;
		look: BrGlamorousLabelLook new;
		text: aText
]
