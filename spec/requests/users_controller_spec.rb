require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # initialize test data 
  let!(:users) { create_list(:user, 10)}
  let(:user_id) {users.first.id}

  # Test suite GET v1/users
  describe 'Get /v1/users' do
    before {get '/v1/users'}
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    it 'returns all users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end    
  end

  #Test suite for GET user details
  describe 'GET /v1/users/:id' do
    before {get "/v1/users/#{user_id}"}

    context 'When user record exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns user details' do
        expect(json['id']).to eq(user_id)
      end
    end

    context 'When user record does not exist' do
      let(:user_id){4512}
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns error message' do
      end
    end
  end

  #Test suite for POST 
  describe 'Post /v1/users' do
    let (:valid_attributes) {{
      user_name: "shumx",
      first_name: "Shumai",
      last_name: "Okay",
      email: "shumx@hotmail.com",
      password:  "pass123"
    }}

    context 'When the request is valid' do
      before {post '/v1/users', params: valid_attributes}
      it 'creates user' do
        expect(json["user_name"]).to eq("shumx")
        expect(json["first_name"]).to eq("Shumai")
        expect(json["last_name"]).to eq("Okay")
        expect(json["email"]).to eq("shumx@hotmail.com")
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    
    context 'When the request is invalid' do
      let (:invalid_attributes) {{
        user_name: "shumx",
        first_name: "Shumai",
        last_name: "Okay",
        email: nil,
        password:  "pass123"
      }}
      before { post '/v1/users', params: invalid_attributes }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body).to match(
          /Validation failed: Email can't be blank/
        )
      end
    end
  end

  #Test suite for PUT
  describe 'Put /v1/users/:id' do
    let(:valid_attributes) {{user_name: "Shero"}}
    before {put "/v1/users/#{user_id}" }

    context 'When the user exists' do
      it 'updates record'do
        expect(response.body).to be_empty
      end
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  #Test suite for DELETE 
  describe 'DELETE /v1/users/:id' do
    before { delete "/v1/users/#{user_id}"}
    context 'When a valid id given' do
      it 'resturns status of 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
