#version 150

#moj_import <vsh_util.glsl>
#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in vec2 UV2;
in vec3 Normal;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform int FogShape;
uniform mat4 ProjMat;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec2 texCoord2;
out vec4 normal;

void main() {
    
    vec3 pos = Position;

    // Skip GUI
    if (isGUI(ProjMat)) {
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
        vertexColor = Color;

    } else {
        #moj_import <block_shader.glsl>

        vertexDistance = fog_distance(ModelViewMat, viewPos, FogShape);
        vertexColor = outputColor;
    }
    
    texCoord0 = UV0;
    texCoord2 = UV2;
}
