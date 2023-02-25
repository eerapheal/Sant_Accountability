require 'rails_helper'

RSpec.describe 'groups/index.html.erb', type: :view do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }

  before(:each) do
    assign(:user, user)
    assign(:groups, [])
  end

  it 'displays the categories header' do
    render

    expect(rendered).to have_content('Categories')
  end
end
