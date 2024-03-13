#pragma once
#include "Camera.h"
#include <SDL2/SDL.h>
//FPS kamera
class CameraManipulator
{
public:
	void SetCamera(Camera* pCamera);

	void Update(float elapsedTime);

	void MouseMove(const SDL_MouseMotionEvent& key);

private:
	Camera* pCamera = nullptr;

	float fi = 0.0f;
	float theta = 0.0f;
	float distance = 5.f;

	glm::vec3 eye = glm::vec3(0, 0, 5);
	glm::vec3 center = glm::vec3(0);
};

