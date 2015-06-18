class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(item_id, quantity)
    unless quantity.to_i.zero?
      contents[item_id.to_s] ||= 0
      contents[item_id.to_s] += quantity.to_i
    end
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def update_item(item_id, quantity)
    unless quantity.to_i.zero?
      contents[item_id.to_s] = quantity.to_i
    end
  end

  def remove_item(item_id)
    contents.delete(item_id.to_s)
  end
end
