"
I represent the Bloc space where the Game of Life is running

"
Class {
	#name : #GOLSpace,
	#superclass : #BlElement,
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
	boardElem := GOLBoard defaultBoard.
	headerElem := GOLHeader createWithModel: boardElem gameModel.
	boardElem gameModel announcer
		when: GOLNextLifeAnnouncement
		send: #onNextLife
		to: headerElem.
	boardElem gameModel announcer
		when: GOLLastLifeAnnouncement
		send: #onLastLife
		to: headerElem.
	headerGap := headerElem defaultHeight.
	self
		size: boardElem width @ (boardElem height + headerGap).
	self 
		layout:
			(BlGridLayout new
				columnCount: 1;
				rowCount: 2);
		background: Color white;
		addChildren:
			{headerElem.
			boardElem}
]
