Class {
	#name : #GOLSpace,
	#superclass : #BlSpace,
	#instVars : [
		'backButtonElem',
		'startButtonElem',
		'nextButtonElem',
		'cols',
		'age',
		'grid',
		'rows',
		'ageTextElem'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLSpace >> cols [

  ^cols
]

{ #category : #creating }
GOLSpace >> createAgeText: anInteger [
	| locationLabel textElem |
	locationLabel := anInteger asRopedText
		foreground: Color white;
		fontSize: 16;
		fontName: 'Helvetica';
		thin.
	textElem := BlTextElement text: locationLabel.
	^ textElem
]

{ #category : #initialization }
GOLSpace >> initialize [
	super initialize.
	self initializeElementsAndAppearance.
	self initializeInteractivity.
	self show
]

{ #category : #initialization }
GOLSpace >> initializeElementsAndAppearance [
	| headerElem boardElem |
	age := 0.
	ageTextElem := GOLLabel text: age.
	backButtonElem := GOLButton text: 'Back'.
	startButtonElem := GOLButton text: 'Start'.
	nextButtonElem := GOLButton text: 'Next'.
	headerElem := GOLHeader new.
	headerElem
		addChildren:
			{ageTextElem.
			backButtonElem.
			startButtonElem.
			nextButtonElem}.
	boardElem := GOLBoard new.
	self
		extent:
			boardElem defaultWidth
				@ (boardElem defaultHeight + headerElem defaultHeight);
		title: 'Conway''s Gamo of Life'.
	rows := boardElem height / self resolution.
	cols := boardElem width / self resolution.
	grid := Array2D rows: rows columns: cols.
	self root
		layout:
			(BlGridLayout new
				columnCount: 1;
				rowCount: 2);
		background: Color white;
		addChildren:
			{headerElem.
			boardElem}
]

{ #category : #initialization }
GOLSpace >> initializeInteractivity [
	
]

{ #category : #initialization }
GOLSpace >> resolution [
	^ 4
]

{ #category : #accessing }
GOLSpace >> rows [

  ^rows
]
