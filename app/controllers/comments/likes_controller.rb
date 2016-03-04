class Comments::LikesController < LikesController
 before_filter :set_likeable
 


  private
    def set_likeable
      array = request.path.split("/")
      resource, id = array[3], array[4]
      @likeable = resource.singularize.classify.constantize.find(id)
    end

end