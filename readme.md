GDSCRIPT FORMATTING STANDARDS
Consistency is dope 

DOCSTRINGS
```
extends Node2D
## A brief description of the class's role and functionality.
##
## The description of the script, what it can do,
## and any further detail.
##
## @tutorial:            https://the/tutorial1/url.com
## @tutorial(Tutorial2): https://the/tutorial2/url.com
## @experimental

func my_func():
	pass

inline comment style is fine....I guess
```
BBCODE also possible
```
Move the [Sprite2D]
```

# Define a format string with placeholder '%s'
var format_string = "We're waiting for %s."

# Using the '%' operator, the placeholder is replaced with the desired value
var actual_string = format_string % "Godot"

print(actual_string)
# Output: "We're waiting for Godot."
