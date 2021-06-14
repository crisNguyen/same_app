require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = user(:michael)
    @micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
end
