require "application_system_test_case"

class RetroBoardsTest < ApplicationSystemTestCase
  setup do
    @retro_board = retro_boards(:one)
  end

  test "visiting the index" do
    visit retro_boards_url
    assert_selector "h1", text: "Retro Boards"
  end

  test "creating a Retro Board" do
    visit retro_boards_url
    click_on "New Retro Board"

    fill_in "Description", with: @retro_board.description
    fill_in "Title", with: @retro_board.title
    click_on "Create Retro Board"

    assert_text "Retro Board was successfully created"
    click_on "Back"
  end

  test "updating a Retro Board" do
    visit retro_boards_url
    click_on "Edit", match: :first

    fill_in "Description", with: @retro_board.description
    fill_in "Title", with: @retro_board.title
    click_on "Update Retro Board"

    assert_text "Retro Board was successfully updated"
    click_on "Back"
  end

  test "destroying a Retro Board" do
    visit retro_boards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Retro Board was successfully destroyed"
  end
end
