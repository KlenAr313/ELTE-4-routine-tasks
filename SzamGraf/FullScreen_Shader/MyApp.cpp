#include "MyApp.h"
#include "SDL_GLDebugMessageCallback.h"

#include <imgui.h>

CMyApp::CMyApp()
{
}

CMyApp::~CMyApp()
{
}

void CMyApp::SetupDebugCallback()
{
	// engedélyezzük és állítsuk be a debug callback függvényt ha debug context-ben vagyunk 
	GLint context_flags;
	glGetIntegerv(GL_CONTEXT_FLAGS, &context_flags);
	if (context_flags & GL_CONTEXT_FLAG_DEBUG_BIT) {
		glEnable(GL_DEBUG_OUTPUT);
		glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS);
		glDebugMessageControl(GL_DONT_CARE, GL_DONT_CARE, GL_DEBUG_SEVERITY_NOTIFICATION, 0, nullptr, GL_FALSE);
		glDebugMessageCallback(SDL_GLDebugMessageCallback, nullptr);
	}
}

void CMyApp::InitShaders()
{
	m_programID = glCreateProgram();
	AssembleProgram( m_programID, "Shaders/Vert_FullscreenNoBuffer.vert", "Shaders/Frag_PosCol_Time.frag" );
}

void CMyApp::CleanShaders()
{
	glDeleteProgram( m_programID );
}

bool CMyApp::Init()
{
	SetupDebugCallback();

	// törlési szín legyen kékes
	glClearColor(0.125f, 0.25f, 0.5f, 1.0f);

	InitShaders();

	//
	// egyéb inicializálás
	//

	glEnable(GL_CULL_FACE); // kapcsoljuk be a hátrafelé néző lapok eldobását
	glCullFace(GL_BACK);    // GL_BACK: a kamerától "elfelé" néző lapok, GL_FRONT: a kamera felé néző lapok

	glEnable(GL_DEPTH_TEST); // mélységi teszt bekapcsolása (takarás)

	return true;
}

void CMyApp::Clean()
{
	CleanShaders();
}

void CMyApp::Update( const SUpdateInfo& updateInfo )
{
	m_ElapsedTimeInSec = updateInfo.ElapsedTimeInSec;
}

void CMyApp::Render()
{
	// töröljük a frampuffert (GL_COLOR_BUFFER_BIT)...
	// ... és a mélységi Z puffert (GL_DEPTH_BUFFER_BIT)
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	// shader bekapcsolasa
	glUseProgram( m_programID );

	// !!!!! VARÁZSLAT !!!!
	// Erről bővebben késübb...
	glUniform1f( glGetUniformLocation( m_programID, "ElapsedTimeInSec" ), m_ElapsedTimeInSec );
	// !!!!!!!!!!!!

	// kirajzolás: https://www.khronos.org/registry/OpenGL-Refpages/gl4/html/glDrawArrays.xhtml
	glDrawArrays( GL_TRIANGLES,	// primitív típusa; amikkel mi foglalkozunk: GL_POINTS, GL_LINE_STRIP, GL_LINES, GL_TRIANGLE_STRIP, GL_TRIANGLE_FAN, GL_TRIANGLES
				  0,			// ha van tároló amiben a kirajzolandó geometriák csúcspontjait tároljuk, akkor annak hányadik csúcspontjától rajzoljunk - most nincs ilyen, 
								// csak arra használjuk, hogy a gl_VertexID számláló a shader-ben melyik számról induljon, azaz most nulláról
				  6 );			// hány csúcspontot használjunk a primitívek kirajzolására - most: gl_VertexID számláló 0-tól indul és 5-ig megy, azaz összesen 6x fut le a vertex shader

	// shader kikapcsolasa
	glUseProgram( 0 );

}

void CMyApp::RenderGUI()
{
	// ImGui::ShowDemoWindow();
}

// https://wiki.libsdl.org/SDL2/SDL_KeyboardEvent
// https://wiki.libsdl.org/SDL2/SDL_Keysym
// https://wiki.libsdl.org/SDL2/SDL_Keycode
// https://wiki.libsdl.org/SDL2/SDL_Keymod

void CMyApp::KeyboardDown(const SDL_KeyboardEvent& key)
{
	if (key.repeat == 0) {
		if (key.keysym.sym == SDLK_F5 && key.keysym.mod & KMOD_CTRL) {
			CleanShaders();
			InitShaders();
		}
	}
}

void CMyApp::KeyboardUp(const SDL_KeyboardEvent& key)
{
}

// https://wiki.libsdl.org/SDL2/SDL_MouseMotionEvent

void CMyApp::MouseMove(const SDL_MouseMotionEvent& mouse)
{

}

// https://wiki.libsdl.org/SDL2/SDL_MouseButtonEvent

void CMyApp::MouseDown(const SDL_MouseButtonEvent& mouse)
{
}

void CMyApp::MouseUp(const SDL_MouseButtonEvent& mouse)
{
}

// https://wiki.libsdl.org/SDL2/SDL_MouseWheelEvent

void CMyApp::MouseWheel(const SDL_MouseWheelEvent& wheel)
{
}


// a két paraméterben az új ablakméret szélessége (_w) és magassága (_h) található
void CMyApp::Resize(int _w, int _h)
{
	glViewport(0, 0, _w, _h);
}

// Le nem kezelt, egzotikus esemény kezelése
// https://wiki.libsdl.org/SDL2/SDL_Event

void CMyApp::OtherEvent( const SDL_Event& ev )
{

}

