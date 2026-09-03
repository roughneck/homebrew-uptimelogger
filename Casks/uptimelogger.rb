cask "uptimelogger" do
  version "0.2.0"
  sha256 "082d3828e83e08a243ec46b99e1e05b388403a9059247bc36a61e76babc0152d"

  url "https://github.com/roughneck/uptime-logger/releases/download/v#{version}/UptimeLogger-#{version}.dmg",
      verified: "github.com/roughneck/uptime-logger/"
  name "UptimeLogger"
  desc "Records internet outages and shows the history as a calendar heatmap"
  homepage "https://uptimelogger.bartels.ug/"

  livecheck do
    url "https://uptimelogger.bartels.ug/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :big_sur"

  app "UptimeLogger.app"

  uninstall quit:      "app.uptimelogger",
            launchctl: "app.uptimelogger"

  zap trash: [
    "~/Library/Application Support/UptimeLogger",
    "~/Library/LaunchAgents/app.uptimelogger.plist",
  ]
end
