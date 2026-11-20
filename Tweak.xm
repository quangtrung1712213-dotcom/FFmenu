#import <UIKit/UIKit.h>
#include <cmath>
#include "imgui.h"
#include "imgui_impl_metal.h"

#define OFF_WORLD_TO_SCREEN 0x72A9EEC
#define OFF_GET_HEAD_TF 0x1220b74
#define OFF_SET_AIM_ROT 0x11ad820
#define OFF_GET_CUR_HP 0x1207cbc
#define OFF_GET_MAX_HP 0x1207dfc
#define OFF_GET_VISIBLE 0x11b1254

bool bESPBox = true;
bool bESPLine = true;
bool bESPHP = true;
bool bAimbot = false;
float fAimRadius = 150.0f;
float screenWidth, screenHeight;

ImVec2 WorldToScreen(UnityEngine::Vector3 worldPos, UnityEngine::Matrix4x4 viewMatrix) {
    UnityEngine::Vector4 screenPos = viewMatrix * UnityEngine::Vector4(worldPos.x, worldPos.y, worldPos.z, 1.0f);
    if (screenPos.w < 0.1f) return ImVec2(-1, -1);
    float invW = 1.0f / screenPos.w;
    float x = screenPos.x * invW;
    float y = screenPos.y * invW;
    float screenX = (screenWidth / 2.0f) + (x * screenWidth / 2.0f);
    float screenY = (screenHeight / 2.0f) - (y * screenHeight / 2.0f);
    return ImVec2(screenX, screenY);
}

void DrawMenu() {
    ImGui::Begin("Freddy's OB55 Menu");
    ImGui::Checkbox("ESP Box", &bESPBox);
    ImGui::Checkbox("ESP Line", &bESPLine);
    ImGui::Checkbox("ESP HP", &bESPHP);
    ImGui::Spacing();
    ImGui::Checkbox("Aimbot (Head)", &bAimbot);
    ImGui::SliderFloat("Aim Radius", &fAimRadius, 50.0f, 600.0f);
    ImGui::End();
}

void RenderESP(ImDrawList* draw_list) {
    // Logic vẽ ESP
}

void ProcessAimbot() {
    // Logic Aimbot
}
