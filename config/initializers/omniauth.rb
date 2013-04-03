Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linked_in, '54lpcvck0g3c', '48fK1J3k9nw6Pp51'
  provider :facebook, '222424071230782', '902cce4522a3185b00a9bf7fa83f5334' if Rails.env.development?
end