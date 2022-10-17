#version 150

#moj_import <vsh_util.glsl>
#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform int FogShape;
uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec2 texCoord1;
out vec2 texCoord2;
out vec4 normal;

void main() {

    #moj_import <entity_shader.glsl>

    // Populate outputs
    vertexDistance = fog_distance(ModelViewMat, viewPos, FogShape);
    vertexColor = outputColor;
    texCoord0 = UV0;
}
