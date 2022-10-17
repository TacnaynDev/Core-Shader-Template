# Core Shader Template
Have you ever tried writing a core shader? There are over 150 files that have to be edited to make something very simple. There are existing templates, but at best they reduce the workload down to 10 files, and there is still endless copy-pasting.  
  
This shader template reduces the workload down to **two** files! There are clear instructions written inside to make learning shaders much easier, and all the edge-cases are handled for you.
  
Based on Onnowhere's shader template: [https://github.com/onnowhere/core_shaders/tree/master/CoreShadersCustomTemplateRP](https://github.com/onnowhere/core_shaders/tree/master/CoreShadersCustomTemplateRP)

## How to use
1. Go to assets > minecraft > shaders > include  
2. Edit the files called entity_shader & block_shader  
3. Profit.  
  
Onnowhere's utility functions are included.  
Other files may be modified by more advanced users. 

## Learn More  
https://github.com/McTsts/Minecraft-Shaders-Wiki
  
## Known Issues  
Transparent moving blocks do not render properly when modified  
  
## TODO  
Remove unnecessary UV maps from fragment shaders to further optimize template  
Add support for customizing GUI and text elements more easily
