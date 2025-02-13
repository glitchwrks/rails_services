require 'rails_helper'

feature 'Create a preorder for a project' do
  
  context 'with an enabled project' do
    let!(:project) { FactoryBot.create(:project, :enabled) }

    scenario 'User goes to project page to find a preorderable project' do
      visit projects_path
      expect(page).to have_text 'This is a list of all active projects'
      expect(page).to have_text(project.printable_name)
      click_on 'Sign Up for Preorder'
      expect(page).to have_text 'Please fill out the following information to preorder'
    end

    context 'from the Create Preorder page' do

      before(:each) do
        visit new_preorder_path(:project => project.name)
      end

      scenario 'User submits a blank form' do
        click_button 'Create Preorder'
        expect(page).to have_text('You must specify at least one quantity')
        expect(page).to have_text("can't be blank")
      end

      scenario 'User submits a duplicate email for the same project' do
        FactoryBot.create(:populated_preorder, :project => project, :email => 'dupe@glitchwrks.com')

        fill_in :email, :with => 'dupe@glitchwrks.com'
        click_button 'Create Preorder'
        expect(page).to have_text('already registered for this project')
      end

      scenario 'User fails the CAPTCHA' do
        expect_any_instance_of(RecaptchaVerificationService).to receive(:execute).and_return(false)

        fill_in :name, :with => 'The Tester'
        fill_in :email, :with => 'test@glitchwrks.com'
        fill_in 'bare boards', :with => '1'
        click_button 'Create Preorder'
        expect(page).to have_text('CAPTCHA failed, please try again')
      end

      scenario 'User creates a preorder for an enabled project' do
        expect_any_instance_of(RecaptchaVerificationService).to receive(:execute).and_return(true)

        expect(page).to have_text("one or more #{project.printable_name}")

        fill_in :name, :with => 'The Tester'
        fill_in :email, :with => 'test@glitchwrks.com'
        fill_in 'bare boards', :with => '1'
        fill_in :kits, :with => '2'
        fill_in :assembled, :with => '3'
        click_button 'Create Preorder'

        expect(page).to have_text('Preorder Successfully Submitted')
        expect(Preorder.find_by(:name => 'The Tester', :project_id => project.id)).to be_present
        expect(Preorder.find_by(:name => 'The Tester', :project_id => project.id).confirmation_token).to be_present
      end
    end
  end

  context 'with a disabled project' do
    let!(:disabled_project) { FactoryBot.create(:project, :disabled) }

    scenario 'User tries to preorder a disabled project' do
      visit new_preorder_path(:project => disabled_project.name)

      expect(page).to have_text('The project you requested is currently disabled.')
    end
  end

  scenario 'User tries to preorder an invalid project' do
    visit new_preorder_path('invalid_project_id')
    expect(page).to have_text("Couldn't find Project")
  end
end