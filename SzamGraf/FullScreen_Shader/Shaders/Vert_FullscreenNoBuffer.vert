#version 430

// lokális változók: két tömb
vec4 positions[6] = vec4[6](
	vec4(-1, -1, 0, 1),
	vec4( 1, -1, 0, 1),
	vec4(-1,  1, 0, 1),

	vec4(-1,  1, 0, 1),
	vec4( 1, -1, 0, 1),
	vec4( 1,  1, 0, 1)
);

vec4 colors[6] = vec4[6](
	vec4(1, 0, 0, 1),
	vec4(0, 1, 0, 1),
	vec4(0, 0, 1, 1),

	vec4(0, 0, 1, 1),
	vec4(0, 1, 0, 1),
	vec4(1, 1, 1, 1)
);


// a pipeline-ban tovább adandó értékek
out vec4 vs_out_color;

out vec4 vs_out_pos;

void main()
{
	// gl_VertexID: https://www.khronos.org/registry/OpenGL-Refpages/gl4/html/gl_VertexID.xhtml
	gl_Position  = positions[gl_VertexID];
	vs_out_color = colors[gl_VertexID];
	vs_out_pos = positions[gl_VertexID];
}