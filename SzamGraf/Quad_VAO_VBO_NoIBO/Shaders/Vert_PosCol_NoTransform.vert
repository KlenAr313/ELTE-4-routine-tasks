#version 430

// VBO-ból érkező változók
layout( location = 0 ) in vec3 vs_in_position;
layout( location = 1 ) in vec3 vs_in_color;

// a pipeline-ban tovább adandó értékek
out vec3 vs_out_color;

void main()
{
    // A gl_Position MINDIG vec4 kell hogy legyen. 
    // Mivel a bemenő pozíció itt vec3, ezért egy 1.0-val kiegészítjük.
	gl_Position  = vec4( vs_in_position, 1.0 ); 
	vs_out_color = vs_in_color;
}