#version 430

// VBO-ból érkező változók
layout( location = 0 ) in vec3 vs_in_position;
layout( location = 1 ) in vec3 vs_in_color;

// a pipeline-ban tovább adandó értékek
out vec3 vs_out_color;

// shader külső paraméterei

// transzformációs mátrixok
uniform mat4 world;
uniform mat4 viewProj; // Egyben adjuk át, előre össze szorozva a view és projection mátrixokat.

void main()
{
	gl_Position  = viewProj * world * vec4( vs_in_position, 1.0 );
	vs_out_color = vs_in_color;
}