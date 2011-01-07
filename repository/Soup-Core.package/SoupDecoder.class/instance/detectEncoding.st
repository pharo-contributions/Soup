accessing
detectEncoding
	xmlData := string.
	[self sniffNonAsciiCompatibleEncoding.
	self sniffEncoding]
		on: Error do: [:e | ]
			