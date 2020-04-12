"
I represent the Bloc space where the Game of Life is running

"
Class {
	#name : #GOLSpace,
	#superclass : #BlSpace,
	#instVars : [
		'headerGap'
	],
	#category : #'RPR-GameOfLife-Elements'
}

{ #category : #initialization }
GOLSpace >> initialize [
	"Create and position the elements to display on the board. 
	 Adds the header and its control objects and the defaultBoard"

	| headerElem boardElem |
	super initialize.
	headerElem := GOLHeader new.
	boardElem := GOLBoard defaultBoard.
	headerGap := headerElem defaultHeight.
	self
		extent: boardElem width @ (boardElem height + headerGap);
		title: 'Conway''s Game of Life'.
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
