require 'test_helper'

class AppTest < ActiveSupport::TestCase
  
  setup do
    @app1 = apps(:one)
    @app2 = apps(:two)
    
  end
  
  test "method test" do
    assert @app1.has_youtube?
    assert !@app2.has_youtube?
  end

end
