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

vec2 cplx_mul(vec2 u, vec2 v)
{
	return vec2(
		u.x * v.x - u.y * v.y, 
		u.x * v.y + u.y * v.x);
}

void main()
{
	/*fs_out_col = vec4(vec3(circle(vs_out_pos.x, vs_out_pos.y)), 1.0);*/
	vec2 c = vs_out_pos.xy;
	vec2 z = c;

	for(int i = 0; i < 100; ++i)
	{
		z = cplx_mul(z, z) + c;
	}

	if(length(z) < 2)
		fs_out_col = vs_out_color;
	else
		discard;
}


/*
Legyen Kör -> Körvonal -> Nő~Csökken*/
