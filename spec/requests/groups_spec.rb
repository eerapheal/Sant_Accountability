require 'rails_helper'

RSpec.describe '/groups', type: :request do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Group.create! valid_attributes
      get '/groups'
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      group = Group.create! valid_attributes
      get "/groups/#{group.id}"
      expect(response).to be_successful
    end
  end

  # describe 'GET /new' do
  #   it 'renders a successful response' do
  #     get '/groups/new'
  #     expect(response).to be_successful
  #   end
  # end

  describe 'GET /edit' do
    it 'renders a successful response' do
      group = Group.create! valid_attributes
      get "/groups/#{group.id}/edit"
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Group' do
        expect do
          post '/groups', params: { group: valid_attributes }
        end.to change(Group, :count).by(1)
      end

      it 'redirects to the created group' do
        post '/groups', params: { group: valid_attributes }
        expect(response).to redirect_to("/groups/#{Group.last.id}")
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Group' do
        expect do
          post '/groups', params: { group: invalid_attributes }
        end.to change(Group, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post '/groups', params: { group: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested group' do
        group = Group.create! valid_attributes
        patch "/groups/#{group.id}", params: { group: new_attributes }
        group.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the group' do
        group = Group.create! valid_attributes
        patch "/groups/#{group.id}", params: { group: new_attributes }
        group.reload
        expect(response).to redirect_to("/groups/#{group.id}")
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        group = Group.create! valid_attributes
        patch "/groups/#{group.id}", params: { group: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested group' do
      group = Group.create! valid_attributes
      expect do
        delete "/groups/#{group.id}"
      end.to change(Group, :count).by(-1)
    end

    it 'redirects to the groups list' do
      group = Group.create! valid_attributes
      delete group_url(group)
      expect(response).to redirect_to(groups_url)
    end
  end
end