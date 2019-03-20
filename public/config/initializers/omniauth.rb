OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '725562981007-1m54kjtpr8gnsm9371cnndngras4hth5.apps.googleusercontent.com',
           'VHl2N6qtAn9PVS1_l7o5Gh1E',
           client_options:
            { ssl:
                 { ca_file: Rails.root.join('cacert.pem').to_s } }
end
