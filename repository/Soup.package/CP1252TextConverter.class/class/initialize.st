as yet unclassified
initialize
	ToTable := Dictionary new.
	ToTable at: 16r80 put: 16r20AC.
	"16r81 is unused "
	ToTable at: 16r82 put: 16r201A.
	ToTable at: 16r83 put: 16r0192.
	ToTable at: 16r84 put: 16r201E.
	ToTable at: 16r85 put: 16r2026.
	ToTable at: 16r86 put: 16r2020.
	ToTable at: 16r87 put: 16r2021.
	ToTable at: 16r88 put: 16r02C6.
	ToTable at: 16r89 put: 16r2030.
	ToTable at: 16r8A put: 16r0160.
	ToTable at: 16r8B put: 16r2039.
	ToTable at: 16r8C put: 16r0152.
	"16r8D is unused "
	ToTable at: 16r8E put: 16r017D.
	"16r8F is unused "
	"16r90 is unused "
	ToTable at: 16r91 put: 16r2018.
	ToTable at: 16r92 put: 16r2019.
	ToTable at: 16r93 put: 16r201C.
	ToTable at: 16r94 put: 16r201D.
	ToTable at: 16r95 put: 16r2022.
	ToTable at: 16r96 put: 16r2013.
	ToTable at: 16r97 put: 16r2014.
	ToTable at: 16r98 put: 16r02DC.
	ToTable at: 16r99 put: 16r2122.
	ToTable at: 16r9A put: 16r0161.
	ToTable at: 16r9B put: 16r203A.
	ToTable at: 16r9C put: 16r0153.
	"16r9D is unused "
	ToTable at: 16r9E put: 16r017E.
	ToTable at: 16r9F put: 16r0178.

	FromTable := Dictionary new.
	ToTable keysAndValuesDo: [
		:key :value |
		FromTable at: value put: key
	]