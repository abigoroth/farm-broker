module ProducesHelper
  def produce_list(produces)
    if produces.count <= 3
    produces.map{|x| x.producename }.join(", ")
  else
    produces.first(3).map{|x| x.producename }.join(", ") + ",..."
  end
  end
end
