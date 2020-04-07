Class {
	#name : #GOLButton,
	#superclass : #BlElement,
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLButton class >> text: aText [
	| labelText label |
	labelText := aText asRopedText
		foreground: Color white;
		fontSize: 16;
		fontName: 'Helvetica';
		thin.
	label := BlTextElement text: labelText.
	^ self new addChild: label
]

{ #category : #initialization }
GOLButton >> initialize [

	super initialize.
	self
		background:
			(Color
				r: 63
				g: 81
				b: 181
				range: 255);
		geometry: (BlRectangle cornerRadius: 2);
		relocate: 100 @ 100;
		padding:
			(BlInsets
				top: 8
				right: 16
				bottom: 8
				left: 16);
		layout: BlLinearLayout horizontal;
		effect:
			(BlGaussianShadowEffect
				color: (Color black alpha: 0.3)
				width: 1
				offset: 0 @ 2);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ]
]
