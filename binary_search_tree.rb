class Node
  attr_accessor(:left, :value, :right)

  # def initialize(value = nil)
  #   @value = value
  # end

  def left_value_right
    [@left, @value, @right]
  end

  def node_exists?(node)
    return node != nil && node.value != nil
  end

  def create_node(node, value)
    node.left = Node.new
    node.right = Node.new
    node.value = value
  end

  def insert(node, value)
    if !node_exists?(node)
      create_node(node, value)
    elsif value < node.value
      insert(node.left, value)
    # elsif value >= node.value
    else
      insert(node.right, value)
    end
  end

  def search(node, value)
    return if !node_exists?
    return node if node.value == value
    return search(node.left, value) if value < node.value
    return search(node.right, value)
  end

  def min(node)
    return if !node_exists?(node)
    return node if !node_exists?(node.left)
    return min(node.left)
  end

  def max(node)
    return if !node_exists?(node)
    return node if !node_exists?(node.right)
    return min(node.right)
  end

  # симметричный обход
  def in_order_traversal(node)
    return if !node_exists?(node)
    in_order_traversal(node.left)
    print("#{node.value} ")
    in_order_traversal(node.right)
  end

  # обратный обход
  def post_order_traversal(node)
    return if !node_exists?
    post_order_traversal(node.left)
    post_order_traversal(node.right)
    print("#{node.value} ")
  end

  # прямой обход
  def pre_order_traversal(node)
    return if !node_exists?
    print("#{node.value} ")
    pre_order_traversal(node.left)
    pre_order_traversal(node.right)
  end

  # замена одного узла другим узлом
  def transplant_node(to_node, from_node)
    to_node.value = from_node.value
    to_node.left = from_node.left
    to_node.right = from_node.right
  end

  # получение количества детей у узла
  def children_count(node)
    count = 0
    count += 1 if node_exists?(node.left)
    count += 1 if node_exists?(node.right)
    return count
  end

  # получение ребенка
  def child_or_nil(node)
    return node_exists?(node.left) ? node.left : node.right
  end

  def remove_node_with_one_or_zero_child(node_to_delete)
    child_to_replace = child_or_nil(node_to_delete)
    transplant_node(node_to_delete, child_to_replace)
  end

  def remove(root, value)
    node_to_delete = search(root, value)
    return false if !node_exists?(node_to_delete)

    if children_count(node_to_delete) < 2
      remove_node_with_one_or_zero_child(node_to_delete)
    else
      min_node = min(node_to_delete.right)
      node_to_delete.value = min_node.value
      remove_node_with_one_or_zero_child(min_node)
    end

    return true
  end
end




n1 = Node.new

arr1 = [5,3,4,2,1]

arr1.each do |el|
  n1.insert(n1, el)
end

n1.in_order_traversal(n1)
