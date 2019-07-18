require 'rails_helper'

describe 'Sections:show', type: :feature do
  let!(:event) { create(:event, :with_sections) }

  before(:each) do
    visit root_path
  end

  context 'show section on index' do
    it 'show' do
      event.sections.each_with_index do |section, i|
        expect(page).to have_content(section.title)
        #expect(page).to have_content(section.content)
        #expect(icon_class).to eq(section.icon)
      end
    end
  end

  context 'icons with links' do
    it do
      event.sections.each_with_index do |section, i|
        expect(page).to have_link((section.id))
      end
    end
  end
end
