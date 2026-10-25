cask "uptimelogger" do
  version "0.2.3"
  sha256 "8d6480b0156471a6f4f87edd45091038a645947c4460e0b32d0afe068cfe30fd"

  url "https://github.com/roughneck/uptime-logger/releases/download/v#{version}/UptimeLogger-#{version}.dmg"
  name "UptimeLogger"
  desc "Records internet outages and shows the history as a calendar heatmap"
  homepage "https://uptimelogger.bartels.ug/"

  livecheck do
    url "https://uptimelogger.bartels.ug/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :big_sur

  app "UptimeLogger.app"

  uninstall launchctl: "app.uptimelogger",
            quit:      "app.uptimelogger"

  zap trash: [
    "~/Library/Application Support/UptimeLogger",
    "~/Library/LaunchAgents/app.uptimelogger.plist",
  ]
end
