#version 150

#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform float GameTime;
uniform mat4 TextureMat;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {
    
    texCoord0 = (TextureMat * vec4(UV0, 0.0, 1.0)).xy;

    vec3 pos = IViewRotMat * Position;

    if(isGUI(ProjMat)){
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        vertexDistance = max(
            length((ModelViewMat * vec4(pos.x, 0.0, pos.z, 1.0)).xyz),
            length((ModelViewMat * vec4(0.0, pos.y, 0.0, 1.0)).xyz));
        vertexColor = Color;
        return;
    }

    vec4 color;
    mat4 projMat;
    float fogDistance;

    #moj_import <entity_shader.glsl>

    // Populate outpus
    vertexDistance = fogDistance;
    vertexColor = color;
}
