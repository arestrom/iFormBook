# Screenshots

library(webshot)
library(dplyr)

# Get the curly braces
webshot("https://wdfw.iformbuilder.com/exzact/FormBuilder/pages/3358331", 
        "screenshots/actions.png", selector = ".actions", zoom = 25) %>% 
        shrink()

# Get the whole page
webshot("https://wdfw.iformbuilder.com/exzact/FormBuilder/pages/3358331", 
        "screenshots/device.png", selector = ".z-index-fix", zoom = 50) %>% 
  shrink()