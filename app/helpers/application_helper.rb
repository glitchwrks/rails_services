module ApplicationHelper
  def test_result(input)
    return 'N' if input.nil?
    input ? 'P' : 'F'
  end
end
