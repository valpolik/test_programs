class Node
  attr_accessor(:left, :value, :right)

  def initialize(start_value = nil)
    _create_node(self, start_value) unless start_value.nil?
  end

  def _node_exists?(node)
    return node != nil && node.value != nil
  end

  def _create_node(node, value)
    node.left = Node.new
    node.right = Node.new
    node.value = value
  end

  def _insert(node, value)
    if !_node_exists?(node)
      _create_node(node, value)
    elsif value < node.value
      _insert(node.left, value)
    # elsif value >= node.value
    else
      _insert(node.right, value)
    end
  end

  def insert(value)
    _insert(self, value)
  end

  def insert_array(arr)
    arr.each do |el|
      insert(el)
    end
  end

  def _search(node, value)
    return if !_node_exists?(node)
    return node if node.value == value
    return _search(node.left, value) if value < node.value
    return _search(node.right, value)
  end

  def search(value)
    result =_search(self, value)
    result.nil? ? result : result.value
  end

  def _min(node)
    return if !_node_exists?(node)
    return node if !_node_exists?(node.left)
    return _min(node.left)
  end

  def min
    _min(self).value
  end

  def _max(node)
    return if !_node_exists?(node)
    return node if !_node_exists?(node.right)
    return _max(node.right)
  end

  def max
    _max(self).value
  end

  # симметричный обход
  def _in_order_traversal(node)
    return if !_node_exists?(node)
    _in_order_traversal(node.left)
    print("#{node.value} ")
    _in_order_traversal(node.right)
  end

  def in_order_traversal
    _in_order_traversal(self)
  end

  def _in_order_traversal_to_array(node, arr)
    return if !_node_exists?(node)
    _in_order_traversal_to_array(node.left, arr)
    arr << node.value
    _in_order_traversal_to_array(node.right, arr)
  end

  def in_order_traversal_to_array
    arr = []
    _in_order_traversal_to_array(self, arr)
    arr
  end

  # обратный обход
  def _post_order_traversal(node)
    return if !_node_exists?(node)
    _post_order_traversal(node.left)
    _post_order_traversal(node.right)
    print("#{node.value} ")
  end

  def post_order_traversal
    _post_order_traversal(self)
  end

  # прямой обход
  def _pre_order_traversal(node)
    return if !_node_exists?(node)
    print("#{node.value} ")
    _pre_order_traversal(node.left)
    _pre_order_traversal(node.right)
  end

  def pre_order_traversal
    _pre_order_traversal(self)
  end

  # замена одного узла другим узлом
  def _transplant_node(to_node, from_node)
    to_node.value = from_node.value
    to_node.left = from_node.left
    to_node.right = from_node.right
  end

  # получение количества детей у узла
  def _children_count(node)
    count = 0
    count += 1 if _node_exists?(node.left)
    count += 1 if _node_exists?(node.right)
    return count
  end

  # получение ребенка
  def _child_or_nil(node)
    return _node_exists?(node.left) ? node.left : node.right
  end

  def _remove_node_with_one_or_zero_child(node_to_delete)
    child_to_replace = _child_or_nil(node_to_delete)
    _transplant_node(node_to_delete, child_to_replace)
  end

  def remove(value)
    _remove(self, value)
  end

  def _remove(root, value)
    node_to_delete = _search(root, value)
    return false if !_node_exists?(node_to_delete)

    if _children_count(node_to_delete) < 2
      _remove_node_with_one_or_zero_child(node_to_delete)
    else
      min_node = _min(node_to_delete.right)
      node_to_delete.value = min_node.value
      _remove_node_with_one_or_zero_child(min_node)
    end

    return true
  end
end




n1 = Node.new(9)
p n1.in_order_traversal_to_array # [9]

n1 = Node.new

n1.insert(6)
p n1.in_order_traversal_to_array # [6]

arr1 = [5,3,4,2,1]

n1.insert_array(arr1)

p n1.min # 1
p n1.max # 6

p n1.search(4) # 4

p n1.in_order_traversal_to_array # [1, 2, 3, 4, 5, 6]

p n1.remove(8) # false
p n1.remove(4) # true
p n1.in_order_traversal_to_array # [1, 2, 3, 5, 6]

p n1.search(4) # nil
