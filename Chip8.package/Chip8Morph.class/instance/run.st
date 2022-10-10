run
run
	| container title footer |
	container := AlignmentMorph newColumn.
	container color: Color gray.
	container  hResizing: #shrinkWrap; 
	     vResizing: #shrinkWrap.	
	
	title := StringMorph new 
           contents: 'Chip-8 Emulator'; 
           color: Color white.
     title hResizing: #spaceFill.
	
	footer := SimpleButtonMorph new
 		label: 'close';
 		target: container; 
 		actionSelector: #delete.
 
	container addMorphBack: title.
	container addMorphBack: self.
	container addMorphBack: footer.
	container openInWorld.

	ActiveHand newKeyboardFocus: self.