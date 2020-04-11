Class {
	#name : #GOLExamples,
	#superclass : #Object,
	#category : #'RPR-GameOfLife'
}

{ #category : #'instance creation' }
GOLExamples class >> open [
	"I create and start a game"

	<script: 'self open'>
	GOLSpace new show
]
