# Fixed positioning

This works in exactly the same way as absolute positioning, with one key
difference: whereas absolute positioning fixes an element in place relative to
its nearest positioned ancestor (the initial containing block if there isn't
one), fixed positioning fixes an element in place relative to the visible
portion of the viewport. 

absolute and fixed positioning removes the element from document flow.

And since those elements are removed from document flow, there is no reference for what width they should be, so they only take as much space as their content.
