require('spec_helper')

describe('the band path', :type => :feature) do
  it('display the bandlist on the front page') do
    visit('/')
    expect(page).to have_content('Bandlist 2015')
  end

  it('allow user to add a band') do
    visit('/')
    click_link('Add a Band')
    fill_in('band_name', :with => 'My Chemical Romance')
    click_button('Add Band')
    expect(page).to have_content('My Chemical Romance')
  end

  it('allow user to access information for a specific band') do
    visit('/')
    click_link('Add a Band')
    fill_in('band_name', :with => 'Simon And Garfunkel')
    click_button('Add Band')
    click_link('Simon And Garfunkel')
    expect(page).to have_content('Simon And Garfunkel')
  end

  it('allows user to update a bands name') do
    visit('/')
    click_link('Add a Band')
    fill_in('band_name', :with => 'system of a down')
    click_button('Add Band')
    click_link('System Of A Down')
    fill_in('update_name', :with => 'weezer')
    click_button('Edit Band')
    expect(page).to have_content('Weezer')
  end

  it('allows a user to delete a band') do
    visit('/')
    click_link('Add a Band')
    fill_in('band_name', :with => 'Simon And Garfunkel')
    click_button('Add Band')
    click_link('Simon And Garfunkel')
    click_button('Delete Band')
    expect(page).not_to have_content('Simon And Garfunkel')
  end

  it('allows a user to add a venue to a band') do
    visit('/')
    click_link('Add a Band')
    fill_in('band_name', :with => 'Fleet Foxes')
    click_button('Add Band')
    click_link('Add or View a Venue')
    fill_in('venue_name', :with => 'East stage')
    click_button('Add Venue')
    click_link('Back')
    click_link('Fleet Foxes')
    check('East Stage')
    click_button('Book Venue')
    expect(page).to have_content('East Stage')
  end
end
