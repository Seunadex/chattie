# frozen_string_literal: true

def setup_user_and_log_in(request)
  user = FactoryBot.create(:user)
  chattie_log_in(request, user)

  user
end

def chattie_log_in(request, user)
  allow(request.env["warden"]).to receive(:authenticate!).and_return(user)
  allow(request.env["warden"]).to receive(:authenticate?).and_return(user)

  allow(controller).to receive(:current_user).at_least(:once).and_return(user)
end
