class Posts::LikesController < LikesController
 before_filter :find_likeable
 


  private
    def find_likeable  
      resource, id = request.path.split("/")[1,2]
      @likeable = resource.singularize.classify.constantize.find(id)
    end

end