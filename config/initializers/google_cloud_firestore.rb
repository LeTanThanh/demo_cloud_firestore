Google::Cloud::Firestore.configure do |config|
  config.project_id  = ENV["FIREBASE_PROJECT_ID"]
  config.credentials = ENV["FIREBASE_CREDENTIALS_PATH"]
end
