#version 150

#moj_import <projection.glsl>
#moj_import <vsh_util.glsl>

in vec3 Position;
vec4 Color; // Initialize color to avoid errors

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform float GameTime;

out vec4 texProj0;

void main() {
    

    if(isGUI(ProjMat)){
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    } else {
        
        #moj_import <entity_shader.glsl>

    }

    texProj0 = projection_from_position(gl_Position);
}
