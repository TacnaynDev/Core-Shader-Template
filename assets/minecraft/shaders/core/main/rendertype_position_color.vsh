// Bottom half of sky, sun & moon, and various GUI elements

#version 150

#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;

uniform mat4 ModelViewMat;
uniform mat3 IViewRotMat;
uniform mat4 ProjMat;
uniform float GameTime;

out vec4 vertexColor;
out vec2 texCoord0;

void main() {

   /* * * * * * * * * * * * * * * * * * * * *
    *  Edit this file manually if the sky   *
    *  is acting strange with your shader.  *
    * * * * * * * * * * * * * * * * * * * * */

    texCoord0 = UV0;
    vertexColor = Color;
    
    // Skip GUI
    if (isGUI(ProjMat)) {
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        return;
    }

    // Use default rendering for sky
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);    
}
