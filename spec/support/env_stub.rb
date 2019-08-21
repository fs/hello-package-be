RSpec.configure do |config|
  config.before do
    {
      "ACTION_DISPATCH_REQUEST_ID" => "4eac02e2-6856-449b-bc28-fbf1b32a20f2",
      "VIDYO_DEVELOPER_KEY" => "vidyo-developer-key",
      "VIDYO_APPLICATION_ID" => "vidyo-application-id",
    }.each do |key, value|
      allow(ENV).to receive(:fetch).with(key).and_return(value)
    end
  end
end
