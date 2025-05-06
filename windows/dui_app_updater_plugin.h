#ifndef FLUTTER_PLUGIN_DUI_APP_UPDATER_PLUGIN_H_
#define FLUTTER_PLUGIN_DUI_APP_UPDATER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace dui_app_updater {

class DuiAppUpdaterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DuiAppUpdaterPlugin();

  virtual ~DuiAppUpdaterPlugin();

  // Disallow copy and assign.
  DuiAppUpdaterPlugin(const DuiAppUpdaterPlugin&) = delete;
  DuiAppUpdaterPlugin& operator=(const DuiAppUpdaterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace dui_app_updater

#endif  // FLUTTER_PLUGIN_DUI_APP_UPDATER_PLUGIN_H_
