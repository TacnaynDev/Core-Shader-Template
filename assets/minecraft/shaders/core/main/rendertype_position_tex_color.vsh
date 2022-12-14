// End sky, main menu panorama, and menu backgrounds
#version 150

#moj_import <vsh_util.glsl>

in vec3 Position;
in vec2 UV0;
in vec4 Color;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform float GameTime;

out vec2 texCoord0;
out vec4 vertexColor;

void main() {

   /* * * * * * * * * * * * * * * * * * * * * * *
    *  Edit this file manually if the end sky   *
    *  is acting strange with your shader.      *
    * * * * * * * * * * * * * * * * * * * * * * */

    texCoord0 = UV0;

    if(isGUI(ProjMat) || isPanorama(ProjMat)){
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        vertexColor = Color;
        return;
    } 

    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    vertexColor = Color;
}
