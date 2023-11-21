require 'rails_helper'

# frozen_string_literal: true

RSpec.describe Api::V1::TestController, { type: :request } do
  describe "GET /api/v1/test" do

    subject { get "/api/v1/test" }

    it "return ok" do
      subject
      json_body = JSON.parse(response.body, symbolize_names: true)
      expect(json_body[:test]).to eq 'ok'
    end
  end
end
