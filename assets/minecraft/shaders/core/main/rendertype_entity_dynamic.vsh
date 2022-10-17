#version 150

#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler2;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 normal;

void main() {
    
    vec3 pos = Position;
    #moj_import <block_shader.glsl>

    // Populate outputs
    vertexDistance = length(viewPos);
    vertexColor = outputColor * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
}
