# Screenshots

library(webshot)
library(dplyr)

# Get the curly braces
webshot("https://wdfw.iformbuilder.com/exzact/FormBuilder/pages/3358331", 
        "screenshots/actions.png", selector = ".actions", zoom = 25) %>% 
        shrink()
