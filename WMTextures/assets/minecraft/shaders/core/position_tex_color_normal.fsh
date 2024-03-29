#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;

in vec2 texCoord0;
in float vertexDistance;
in vec4 vertexColor;
in vec4 normal;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;

    if (color.a < .1) discard;

    fragColor = color
                * vec4(1, 1, 1, 1 - linear_fog_grow(vertexDistance, 200, 300))
                * vec4(1, 1, 1, .75);
}
