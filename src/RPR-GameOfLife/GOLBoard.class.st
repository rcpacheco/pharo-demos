Class {
	#name : #GOLBoard,
	#superclass : #BlSpace,
	#classVars : [
		'age',
		'cols',
		'grid',
		'locationTextElem',
		'rows'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #buttons }
GOLBoard class >> coloredButton: aText [
	<gtExample>
	| button labelText label |
	button := BlElement new
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
			c vertical fitContent ].
	labelText := aText asRopedText
		foreground: Color white;
		fontSize: 16;
		fontName: 'Helvetica';
		thin.
	label := BlTextElement text: labelText.
	button addChild: label.
	button
]

{ #category : #initialization }
GOLBoard class >> resolution [
	^ 4
]

{ #category : #accessing }
GOLBoard >> cols [

  ^cols
]

{ #category : #initialization }
GOLBoard >> initialize [
	super initialize.
	self initializeElementsAndAppearance.
	self initializeInteractivity.
	self show.
]

{ #category : #initialization }
GOLBoard >> initializeElementsAndAppearance [
	| headerSize boardWidth boardHeight headerElem boardElem locationLabel |
	headerSize := 40.
	boardWidth := 600.
	boardHeight := 400.
	self
		extent: boardWidth @ (boardHeight + headerSize);
		title: 'Conway''s Gamo of Life';
		resizable: false.
	rows := (self height - headerSize) / self class resolution.
	cols := self width / self class resolution.
	grid := Array2D rows: rows columns: cols.
	age := 10.
	locationLabel := age asRopedText
		foreground: Color white;
		fontSize: 16;
		fontName: 'Helvetica';
		thin.
	locationTextElem := BlTextElement text: locationLabel.
	headerElem := BlElement new
		background: Color veryDarkGray;
		layout:
			(BlGridLayout new
				columnCount: 4;
				rowCount: 1;
				cellSpacing: 10;
				alignMargins);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: headerSize.
			c frame vertical alignTop ];
		addChildren: {locationTextElem}.
	boardElem := BlElement new
		background: Color gray;
		constraintsDo: [ :c | 
			c horizontal exact: boardWidth.
			c vertical exact: boardHeight.
			c frame horizontal alignCenter.
			c frame vertical alignCenter ].
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
GOLBoard >> initializeInteractivity [
	
]

{ #category : #accessing }
GOLBoard >> rows [

  ^rows
]
