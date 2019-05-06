require 'rails_helper'

describe 'Researchers:index', type: :feature do
  let(:admin) { create(:admin) }
  let!(:researcher) { create(:researcher) }

  before(:each) do
    login_as(admin, scope: :admin)
    visit admins_researchers_path
  end

  it 'index - show all researchers' do
    expect(page).to have_content(researcher.name)
    expect(page).to have_content(researcher.title)
    expect(page).to have_content(researcher.academic_title)
    expect(page).to have_content(researcher.institution.name)
    expect(page).to have_link(href: edit_admins_researcher_path(researcher))
    destroy_link = "a[href='#{admins_researcher_path(researcher)}'][data-method='delete']"
    expect(page).to have_css(destroy_link)
  end
end
