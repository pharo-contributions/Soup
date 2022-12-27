[![Tests](https://github.com/pharo-contributions/Soup/actions/workflows/runTests.yaml/badge.svg)](https://github.com/pharo-contributions/Soup/actions/workflows/runTests.yaml)

Soup is a simple HTML scraping library, ported from Python of [Beautiful Soup](http://www.crummy.com/software/BeautifulSoup/).

## Install

```Smalltalk
Metacello new
	baseline: 'Soup';
	repository: 'github://pharo-contributions/Soup';
	load
 ```
## If you want to depend on it

Add the following code to your Metacello baseline or configuration

```
spec 
   baseline: 'Soup' 
   with: [ spec repository: 'github://pharo-contributions/Soup/' ]
```
## Example Usage
[![Example Usage](http://img.youtube.com/vi/y17pTysVddg/0.jpg)](http://www.youtube.com/watch?v=y17pTysVddg "Example Usage")

## History

- Initial versions by Zulq Alam.
- Copied from http://smalltalkhub.com/#!/~PharoExtras/Soup on 7/28/2016
