defmodule ListFilterTest do
  use ExUnit.Case

  describe "call/1" do
    test "count odd elements" do
      list1 = ["1", "3", "6", "43", "banana", "6", "abc"]
      list2 = ["1a", "3.5", "4", "9"]
      list3 = ["2", "4", "6"]

      assert ListFilter.call(list1) == 3
      assert ListFilter.call(list2) == 1
      assert ListFilter.call(list3) == 0
    end

    test "passing an empty list" do
      list = []
      assert ListFilter.call(list) == 0
    end
  end
end
