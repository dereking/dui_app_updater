#include "include/dui_app_updater/dui_app_updater_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "dui_app_updater_plugin.h"

void DuiAppUpdaterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  dui_app_updater::DuiAppUpdaterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
