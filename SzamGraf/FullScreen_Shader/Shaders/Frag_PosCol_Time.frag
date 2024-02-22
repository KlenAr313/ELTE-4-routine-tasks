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

float circle(float x, float y)
{	
	float h = (sqrt(x*x + y*y) + (cos(ElapsedTimeInSec * 2 ) + 1) / 2); 
	if(h < 1.01 && h > 0.99)
	{
		return 1;
	}
	return 0;
}

void main()
{
	fs_out_col = vec4(vec3(circle(vs_out_pos.x, vs_out_pos.y)), 1.0);
}


/*
Legyen Kör -> Körvonal -> Nő~Csökken*/
