require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase

  test 'visit the index' do
    visit notes_path
    expect(page).to have_content('Your notes')
    expect(page).to have_content('Title')
    expect(page).to have_button('New')
    find_button('New')
  end

  test 'create new note' do
  end

  test 'edit note' do
  end

  test 'delete note' do
  end

end
