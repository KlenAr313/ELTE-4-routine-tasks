#version 430

// pipeline-ból bejövő per-fragment attribútumok
in vec4 vs_out_color;
in vec4 vs_out_pos;

// kimenő érték - a fragment színe
out vec4 fs_out_col;

// !!!!! VARÁZSLAT !!!!
// Erről bővebben késübb...
uniform float ElapsedTimeInSec = 0.0;
// !!!!!!!!!!!!

const float PI = 3.1415;

float myFunc(float t)
{
	return cos(t*2*PI + ElapsedTimeInSec);
}

void main()
{
	fs_out_col = vec4(vec3((myFunc(vs_out_pos.z) + 1)  * 0.5), 1.0);
}


/*
Legyen Kör -> Körvonal -> Nő~Csökken*/
