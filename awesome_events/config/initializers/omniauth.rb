Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "Ov23liGiAAgAYYrUGXwk", "5fcb204fb5a7a7d64855d591b1622880906f3b75"
  else
    provider :github,
    Rails.application.credentials.github[:client_id],
    Rails.application.credentials.github[:client_secret]
  end
end