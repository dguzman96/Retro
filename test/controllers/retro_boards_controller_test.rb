require "test_helper"

class RetroBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @retro_board = retro_boards(:one)
  end

  test "should get index" do
    get retro_boards_url
    assert_response :success
  end

  test "should get new" do
    get new_retro_board_url
    assert_response :success
  end

  test "should create retro_board" do
    assert_difference('RetroBoard.count') do
      post retro_boards_url, params: { retro_board: { description: @retro_board.description, title: @retro_board.title } }
    end

    assert_redirected_to retro_board_url(RetroBoard.last)
  end

  test "should show retro_board" do
    get retro_board_url(@retro_board)
    assert_response :success
  end

  test "should get edit" do
    get edit_retro_board_url(@retro_board)
    assert_response :success
  end

  test "should update retro_board" do
    patch retro_board_url(@retro_board), params: { retro_board: { description: @retro_board.description, title: @retro_board.title } }
    assert_redirected_to retro_board_url(@retro_board)
  end

  test "should destroy retro_board" do
    assert_difference('RetroBoard.count', -1) do
      delete retro_board_url(@retro_board)
    end

    assert_redirected_to retro_boards_url
  end
end
