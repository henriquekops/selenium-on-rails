require 'rails_helper'
# https://rubydoc.info/github/jnicklas/capybara/Capybara/Session#accept_alert-instance_method


RSpec.describe "Acess index", js: true do

  it "shows index page" do
    visit notes_path
    
    expect(page).to have_content('Your notes')
    expect(page).to have_link('New')
  end
end


RSpec.describe "Acess new note", js: true do

  it "shows new note page" do
    visit new_note_path
    
    expect(page).to have_content('New note')
    expect(page).to have_content('Title')
    expect(page).to have_content('Body')
    expect(page).to have_button('Create Note')
    expect(page).to have_link('Back')
  end
end


RSpec.describe "Create valid note", js: true do

  it "creates a note" do
    visit new_note_path

    fill_in 'Title', with: 'My test note'
    fill_in 'Body', with: 'This is a test note'
    click_button('Create Note')

    expect(page).to have_link('Delete')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Back')
    expect(page).to have_content('My test note')
    expect(page).to have_content('This is a test note')
  end
end


RSpec.describe "Create invalid note", js: true do

  it "creates a note with numbered title" do
    visit new_note_path

    fill_in 'Title', with: 'Invalid note 1'
    fill_in 'Body', with: 'This is a test note'
    click_button('Create Note')

    expect(page).to have_content('Title must contain only letters.')
  end

  it "creates a note with too long title" do
    visit new_note_path

    fill_in 'Title', with: 'This is a super long title'
    fill_in 'Body', with: 'This is a test note'
    click_button('Create Note')

    expect(page).to have_content('Title is too long (maximum is 20 characters)')
  end

  it "creates a note without title" do
    visit new_note_path

    fill_in 'Body', with: 'This is a test note'
    click_button('Create Note')

    expect(page).to have_content("Title can't be blank")
  end

  it "creates a note without body" do
    visit new_note_path

    fill_in 'Title', with: 'This is an ok title'
    click_button('Create Note')

    expect(page).to have_content("Body can't be blank")
  end
end


RSpec.describe "Show note", js: true do

  it "creates a note and visits it" do

    visit new_note_path

    fill_in 'Title', with: 'My test note'
    fill_in 'Body', with: 'This is a test note'
    click_button('Create Note')
    click_link('Back')
    click_link('Show')

    expect(page).to have_content('My test note')
    expect(page).to have_content('This is a test note')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
    expect(page).to have_link('Back')
  end
end


RSpec.describe "Delete note", js: true do

  it "creates a note and deletes it" do
    visit new_note_path

    fill_in 'Title', with: 'My test note'
    fill_in 'Body', with: 'This is a test note'

    click_button('Create Note')
    click_link('Delete')
    accept_alert('Are you sure?')
    
    expect(page).to have_content('Your notes')
    expect(page).to have_link('New')
  end
end