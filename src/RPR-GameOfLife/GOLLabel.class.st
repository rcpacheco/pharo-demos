Class {
	#name : #GOLLabel,
	#superclass : #BlTextElement,
	#category : #'RPR-GameOfLife'
}

{ #category : #'instance creation' }
GOLLabel class >> text: aText [
	| aLabel |
	aLabel := aText asRopedText
		foreground: Color white;
		fontSize: 30;
		fontName: 'Helvetica';
		thin.
	^ self new text: aLabel
]
