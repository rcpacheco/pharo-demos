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
		'ageTextElem',
		'stopButtonElem'
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
	backButtonElem := GOLBackButton text: 'Back'.
	startButtonElem := GOLStartButton text: 'Start'.
	stopButtonElem := GOLStopButton text: 'Stop'.
	nextButtonElem := GOLNextButton text: 'Next'.
	headerElem := GOLHeader new.
	headerElem
		addChildren:
			{ageTextElem.
			backButtonElem.
			startButtonElem.
			stopButtonElem.
			nextButtonElem}.
	boardElem := GOLBoard new.
	self
		extent:
			boardElem defaultWidth
				@ (boardElem defaultHeight + headerElem defaultHeight);
		title: 'Conway''s Game of Life'.
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
