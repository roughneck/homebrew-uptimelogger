cask "uptimelogger" do
  version "0.2.1"
  sha256 "ee154b621f43b99396040bd8cb6880c308bf5ac0ac66fa16b044aa4f87688066"

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
