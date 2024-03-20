#include "CameraManipulator.h"

void CameraManipulator::SetCamera(Camera* pCamera) 
{
	this->pCamera = pCamera;

	center = this->pCamera->GetAt();

	glm::vec3 aim = this->pCamera->GetEye() - center;

	distance = glm::length(aim);
	fi = atan2f(aim.z, aim.x);
	theta = acosf(aim.y / distance);
}

void CameraManipulator::MouseMove(const SDL_MouseMotionEvent& mouse)
{
	if (mouse.state & SDL_BUTTON_LMASK)
	{
		fi -= mouse.xrel / 700.f;
		theta = glm::clamp<float>(theta + mouse.yrel / 700.f, 0.1f, 3.1f);
	}
}

void CameraManipulator::Update(float elapsedTime)
{
	if (!pCamera)
		return;

	//fi += elapsedTime;

	glm::vec3 lookDir(
		cosf(fi) * sinf(theta),
		cos(theta),
		sinf(fi) * sinf(theta));

	//eye.x = center.x + distance;
	glm::vec3 lookat = eye - lookDir;

	pCamera->SetView(eye, lookat, pCamera->GetWorldUp());
}