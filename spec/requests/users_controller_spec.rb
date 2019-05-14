require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # initialize test data 
  let!(:users) { create_list(:user, 10)}
  let(:user_id) {users.first.id}

  # Test suite for INDEX GET v1/users
  describe 'Get /v1/users' do
    # make HTTP get request before each example
    before {get '/v1/users'}

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    
  end
  #Test suite for SHOW with GET /v1/users/:id
  describe 'GET /v1/users/:id' do
    before {get "/v1/users/#{user_id}" }

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

  #Test suite for CREATE with POST /v1/users
  describe 'Post /v1/users' do
    #valid payload 
    let (:valid_attributes) {{
      user_name: "shumx",
      first_name: "Shumai",
      last_name: "Okay",
      email: "shumx@hotmail.com",
      password:  "pass123"
    }}

    context 'When the request is valid' do
      before { post '/v1/users', params: valid_attributes }
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
      before { post '/v1/users', params: {user_name: "shumx",first_name: "Shumai"} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/"[\"Last name can't be blank\",
        \"Email can't be blank\",\"Password can't be blank\"]"/)
      end
    end


    
  end
  #Test suite for UPDATE with PUT    /v1/users/:id

  #Test suite for  DELETE /v1/users/:id
  #deletion of users
=begin
End points to test 
  PATCH  /v1/users/:id(.:format) v1/users#update {:format=>"json"}
  PUT    /v1/users/:id(.:format) v1/users#update {:format=>"json"}
  DELETE /v1/users/:id(.:format) v1/users#destroy {:format=>"json"}        
=end

end
