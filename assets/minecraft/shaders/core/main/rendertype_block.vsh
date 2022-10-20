#version 150

#moj_import <light.glsl>
#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform vec3 ChunkOffset;
uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 normal;

void main() {
    
    vec3 pos;
    vec4 color;
    mat4 projMat;
    float fogDistance;

    // Check if vertex is a piston or falling block (entity-type)
    if(ModelViewMat == mat4(1)) 
    {
        pos = IViewRotMat * Position; // Translate Position to world-space

        #moj_import <entity_shader.glsl>
        
    } else {
        
        pos = Position + ChunkOffset; // Add chunk offset

        #moj_import <block_shader.glsl>

    }

    // Populate outputs
    texCoord0 = UV0;
    vertexDistance = fogDistance;
    vertexColor = color * minecraft_sample_lightmap(Sampler2, UV2);
}
