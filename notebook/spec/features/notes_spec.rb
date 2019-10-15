require 'rails_helper'
# https://rubydoc.info/github/jnicklas/capybara/Capybara/Session#accept_alert-instance_method

RSpec.describe "Acess server", js: true do

  it "shows index page" do
    visit notes_path
    
    expect(page).to have_content('Your notes')
    expect(page).to have_link('New')
  end
end


RSpec.describe "Create note", js: true do

  it "shows index page" do
    visit notes_path
    
    expect(page).to have_content('Your notes')
    expect(page).to have_link('New')
  end

  it "creates a note" do
    visit new_note_path
    
    expect(page).to have_content('New Note')
    expect(page).to have_link('Back')

    fill_in 'Title', with: 'My test note'
    fill_in 'Body', with: 'This is a test note'
    click_button('Create Note')


    expect(page).to have_link('Delete')
    expect(page).to have_link('Edit')


    expect(page).to have_content('My test note')
    expect(page).to have_content('This is a test note')
  end
end


RSpec.describe "Delete note", js: true do
  
  it "shows index page" do
    visit notes_path
    
    expect(page).to have_content('Your notes')
    expect(page).to have_link('New')
  end

  it "creates a note and delete it" do
    visit new_note_path
    
    expect(page).to have_content('New Note')
    expect(page).to have_link('Back')

    fill_in 'Title', with: 'My test note'
    fill_in 'Body', with: 'This is a test note'
    click_button('Create Note')

    expect(page).to have_link('Delete')
    expect(page).to have_link('Edit')
    expect(page).to have_content('My test note')
    expect(page).to have_content('This is a test note')

    click_link('Delete')

    accept_alert('Are you sure?')
    
    expect(page).to have_content('Your notes')
    expect(page).to have_link('New')
  end
end