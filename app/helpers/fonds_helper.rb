module FondsHelper
  # Returns hierarcial objects of parents
  def pparent(fond, arr = [])
      tem_arr = arr
    if fond.parent
      tem_arr << fond
      pparent(fond.parent, tem_arr)
    elsif fond.parent.nil? && fond.depth == 0
      tem_arr << fond
    end
    return tem_arr.reverse
  end
end
