cask "uptimelogger" do
  version "0.2.2"
  sha256 "71bc9ba82b5cb49bfbf9b4df6cc6401243069a59d330c43fda4dff54dbb2136e"

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
