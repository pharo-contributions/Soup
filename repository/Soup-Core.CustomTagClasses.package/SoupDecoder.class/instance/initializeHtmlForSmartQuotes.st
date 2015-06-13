initialize
initializeHtmlForSmartQuotes
	htmlForSmartQuotes := Dictionary newFrom: {
		128 -> 'euro'.
		129 -> ' '.
		130 -> 'sbquo'.
		131 -> 'fnof'.
		132 -> 'bdquo'.
		133 -> 'hellip'.
		134 -> 'dagger'.
		135 -> 'Dagger'.
		136 -> 'circ'.
		137 -> 'permil'.
		138 -> 'Scaron'.
		139 -> 'lsaquo'.
		140 -> 'OElig'.
		141 -> ' '.
		142 -> '#x17D'.
		143 -> ' '.
		144 -> ' '.
		145 -> 'lsquo'.
		146 -> 'rsquo'.
		147 -> 'ldquo'.
		148 -> 'rdquo'.
		149 -> 'bull'.
		150 -> 'ndash'.
		151 -> 'mdash'.
		152 -> 'tilde'.
		153 -> 'trade'.
		154 -> 'scaron'.
		155 -> 'rsaquo'.
		156 -> 'oelig'.
		157 -> ' '.
		158 -> '#x17E'.
		159 -> 'Yuml'.
	}.
