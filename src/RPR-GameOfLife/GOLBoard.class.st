Class {
	#name : #GOLBoard,
	#superclass : #BlElement,
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLBoard >> initialize [
	super initialize.
	self
		size: 200 asPoint;
		background: Color lightYellow.
		
	1 to: 20 do: [ :c | 
		self
			addChild:
				((BlLine from: (c * 20) @ 0 to: (c * 20) @ 200) asElement
					border: (BlBorder paint: Color lightBrown width: 2)) ].
	1 to: 20 do: [ :r | 
		self
			addChild:
				((BlLine from: 0 @ (r * 20) to: 200 @ (r * 20)) asElement
					border: (BlBorder paint: Color lightBrown width: 2)) ]
]
